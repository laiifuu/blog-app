class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    if user.role == 'user'
      can :create, Post
      can :destroy, Post, author_id: user.id
      can :create, Comment
      can :destroy, Comment, author_id: user.id
    elsif user.admin?
      can :manage, :all
    end
  end
end
