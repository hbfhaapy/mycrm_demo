class Ability
  include CanCan::Ability
  include ActionView::Helpers

  def initialize(user)
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
    if user.blank?
        
    else
      #default priviledge
        can :dashboard, :index
        can [:update, :read], User, id: user.id
        can :manage, Crm::Deal::Pricelist,user_id: user.id
        id = 1
      #admin
        if user.in_role?("#{id+=1}")
          can :manage, User do |user|
            user.id != 1
          end
        end
        if user.has_role?(:admin)
          can :manage, :all
          cannot :manage, User, id: 1
          cannot :manage, Role
        end
      #super admin
        if user.has_role?(:super_admin)
          can :manage, :all
          cannot :destroy, Role
          can :destroy, Role do |r|
            true if r.users.blank?
          end
        end
      #select
        can :dashboard, :crm if user.in_role?("#{id+=1}")
        can :dashboard, :fm if user.in_role?("#{id+=1}")
        can :dashboard, :oa if user.in_role?("#{id+=1}")

      #crm
        can :see, :crm_nav if user.in_role?("#{id+=1}")
        can :manage, Crm::Contact if user.in_role?("#{id+=1}")
        can :manage, Crm::Company if user.in_role?("#{id+=1}")
        can :manage, Crm::Deal if user.in_role?("#{id+=1}")
        can :manage, Crm::Activity if user.in_role?("#{id+=1}")
        can :manage, Crm::Contact,user_id: user.id if user.in_role?("#{id+=1}")
        can :manage, Crm::Company,user_id: user.id if user.in_role?("#{id+=1}")
        can :manage, Crm::Deal,user_id: user.id if user.in_role?("#{id+=1}")
        can :manage, Crm::Activity,user_id: user.id if user.in_role?("#{id+=1}")

        can :read, Crm::Contact if user.in_role?("#{id+=1}")
        can :read, Crm::Company if user.in_role?("#{id+=1}")
        can :read, Crm::Deal if user.in_role?("#{id+=1}")
        can :read, Crm::Activity if user.in_role?("#{id+=1}")
        can :read, Crm::Contact,user_id: user.id if user.in_role?("#{id+=1}")
        can :read, Crm::Company,user_id: user.id if user.in_role?("#{id+=1}")
        can :read, Crm::Deal,user_id: user.id if user.in_role?("#{id+=1}")
        can :read, Crm::Activity,user_id: user.id if user.in_role?("#{id+=1}")

      #cm
        can :see, :cm_nav if user.in_role?("#{id+=1}")

        can :manage, Cm::Contract if user.in_role?("#{id+=1}")
        can :manage, Cm::Collection if user.in_role?("#{id+=1}")
        can :manage, Cm::Contract,user_id: user.id if user.in_role?("#{id+=1}")
        can :manage, Cm::Collection,user_id: user.id if user.in_role?("#{id+=1}")
        can :read, Cm::Contract if user.in_role?("#{id+=1}")
        can :read, Cm::Collection if user.in_role?("#{id+=1}")
        can :read, Cm::Contract,user_id: user.id if user.in_role?("#{id+=1}")
        can :read, Cm::Collection,user_id: user.id if user.in_role?("#{id+=1}")

      #fm
        can :see, :fm_nav if user.in_role?("#{id+=1}")

        can :manage, Fm::Billing if user.in_role?("#{id+=1}")
        can :manage, Cm::Income if user.in_role?("#{id+=1}")
        can :manage, Cm::Billing,user_id: user.id if user.in_role?("#{id+=1}")
        can :manage, Cm::Income,user_id: user.id if user.in_role?("#{id+=1}")
        can :read, Cm::Billing if user.in_role?("#{id+=1}")
        can :read, Cm::Income if user.in_role?("#{id+=1}")
        can :read, Cm::Billing,user_id: user.id if user.in_role?("#{id+=1}")
        can :read, Cm::Income,user_id: user.id if user.in_role?("#{id+=1}")

      #settings
        can :manage, :properties if user.in_role?("#{id+=1}")
        can :manage, Organization if user.in_role?("#{id+=1}")

        if user.in_role?("#{id+=1}")
          can :manage, Crm::Company::Category
          can :manage, Crm::Phone::Klass
          can :manage, Crm::Contact::Category
          can :manage, Crm::Contact::Status
          can :manage, Crm::Deal::Category
          can :manage, Crm::Deal::Status
          can :manage, Crm::Activity::Category
          can :manage, Crm::Activity::Status
          can :manage, Cm::Contract::Status
        end
    end
  end
end
