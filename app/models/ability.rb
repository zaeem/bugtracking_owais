class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.user_type == "manager"
      can :manage, :all
    else
      can :manage, Bug
    end
  end
end
