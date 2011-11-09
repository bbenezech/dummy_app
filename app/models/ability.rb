class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all
    cannot [:update, :destroy], User, :email => 'username@example.com'
  end
end
