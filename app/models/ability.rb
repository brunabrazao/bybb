class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role.admin?
      can :manage, :all
    elsif user.role.org_admin?
      can :update, Organisation do |org|
        org.users.include?(user)
      end
      can :read, Organisation do |org|
        org.users.include?(user)
      end
      can :read, Report
      can :create, Report
      can :update, Report do |r|
        r.try(:user) == user
      end
      can :read, User do |u|
        u.organisation == user.organisation
      end
      can :update, User do |u|
        u.organisation == user.organisation
      end
      can :destroy, User do |u|
        u.organisation == user.organisation
      end
    elsif user.role.org_member?
      can :update, Report do |r|
        r.try(:user) == user
      end
      can :create, Report
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
