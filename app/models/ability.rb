# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :read, :all
      can :manage, :all if user.user_type == 'manager'
      can :manage, :all if user.user_type == 'admin'
    end
  end
end
