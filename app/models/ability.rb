class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      user = User.new
    end
    if user.has_role? :admin
      can :manage, :all
    else user.has_role? :default
      can :read, Apartment
      can :manage, Apartment, user_id: user.id
    end
  end
end
