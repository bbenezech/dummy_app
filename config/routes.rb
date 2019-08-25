# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'rails_admin/main#dashboard'

  # Needed for :show_in_app tests
  resources :players, only: [:show]
end
