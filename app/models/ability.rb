# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.role?(:admin)
        can :manage, :all
      elsif user.role?(:user)
        can :read, :all
      else
        # set role by default
        can :read, :all
      end
  end
end
