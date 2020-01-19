# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.user_type == 'admin'
        can :manage, :all
      elsif user.user_type == 'manager'
        can :manage, BigRoom
        can :nanage, SmallRoom
      elsif user.user_type == 'regular'
        can :read, :all
      end
    end
  end
end
