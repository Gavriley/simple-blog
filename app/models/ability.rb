class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.role.try(:name) == 'admin'
      can :manage, Post
    else
      can :read, Post
      can :personal, Post
      can :create, Post
      can :update, Post, :user => user
    end
  end
end
