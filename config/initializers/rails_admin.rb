# frozen_string_literal: true

RailsAdmin.config do |config|
  config.excluded_models = ['RelTest', 'PaperTrail::Version', 'PaperTrail::VersionAssociation']

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with { true }
  config.current_user_method { User.first }

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  config.model User do
    field :email
    field :avatar

    edit do
      field :email
      field :password
      field :password_confirmation
      field :remember_me
      field :avatar
    end
  end
end
