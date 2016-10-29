class Ability
  include CanCan::Ability

  def initialize(user)
    File.open('/home/darkness/insilico/log.txt', 'w') { |f| f << "QWERTY" }
    user ||= User.new # guest user (not logged in)
    
    if user.role.try(:name) == 'admin'
      can :read, Post
    else
      can :read, Post
      can :personal, Post
      can :create, Post
      can :update, Post, :user => user
    end
  end
end
