class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role?(:admin)
      can :manage, :all 
    elsif user.role?(:general)
      can :manage, Tictac
      can :read, :all
      can [:show, :update, :destroy], User, :id => user.id
      cannot [:create], User
      cannot [:create, :update, :destroy, :new], Game
    else
      can [:show, :create, :new], User
      can :read, :all
      # read is the equivalent of the index and show views
    end

  end

end


#can [:show, :update, :destroy], User, :id => user.id
#cannot [:create, :update, :destroy], Game


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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

