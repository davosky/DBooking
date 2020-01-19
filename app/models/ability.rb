# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :manage, :all if user.user_type == 'admin'
      if user.user_type == 'manager'
        can :manage, BigRoom
        can :nanage, SmallRoom
      end
      can :read, :all if user.user_type == 'regular'
    end
  end
end
