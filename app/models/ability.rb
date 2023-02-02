class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, :all
    can(%i[create destroy], Post, user:)
    can(:destroy, Comment, user:)
    can :manage, :all if user.role == 'admin'
  end
end
