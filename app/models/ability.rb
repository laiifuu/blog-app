# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, :all
    can [:create, :destroy], Post, user: user
    can :destroy, Comment, user: user
    can :manage, :all if user.role == "admin"
  end
end
