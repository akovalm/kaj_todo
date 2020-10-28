# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role?(:admin)
      can :manage, :all
    elsif user.role?(:user)
      can :manage, [Project, Task], user_id: user.id
    else
      # set role by default
      cannot :manage, :all
    end
  end
end
