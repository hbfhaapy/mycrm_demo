class DashboardCell < Cell::Rails
  helper ApplicationHelper  
  helper FontAwesome::Rails::IconHelper
  helper Cm::CollectionsHelper 
  include Devise::Controllers::Helpers
  helper_method :current_user

  def smartfinders
    @smartfinders = current_user.smartfinders

    render
  end 

  def timeline
    @posts = Crm::Company.where("created_at > ?", Time.now - 14.days).order("created_at DESC")

    render
  end 

  def sales
  @sale_people_situation_chart = User.sale_people_situation_chart
  @deals_situation_chart = Crm::Deal.situation_chart  
  @activities_situation_chart = Crm::Activity.situation_chart
  @contracts_situation_chart = Cm::Contract.situation_chart

  @lasted_deals = Crm::Deal.includes(:user).order("created_at DESC").limit(10)
  @lasted_activities = Crm::Activity.includes(:activityable).order("time DESC").limit(10)
  @lasted_contacts = Crm::Contact.includes(:company, :user).order("created_at DESC").limit(10)

  @company_counts = Crm::Company.count
  @contact_counts = Crm::Contact.count
  @deal_counts = Crm::Deal.count
  @activity_counts = Crm::Activity.count

    render
  end

  def financial
    @collections_situation_chart = Cm::Collection.situation_chart


    @lasted_billings = Fm::Billing.includes(:collection => [:contract => :plan]).order("time DESC").limit(10)
    @lasted_incomes = Fm::Income.includes(:collection => [:contract => :plan]).order("time DESC").limit(10)
    @lasted_collections = Cm::Collection.includes(:contract).order("created_at DESC").limit(10)

    @contract_counts = Cm::Contract.count
    @collection_counts = Cm::Collection.count
    @billing_counts = Fm::Billing.count
    @income_counts = Fm::Income.count
    @next_month_collection_counts = 0
    Cm::Collection.between(Time.now.next_month.at_beginning_of_month, Time.now.next_month.next_month.at_beginning_of_month).each { |a| @next_month_collection_counts += a.contract.amount*a.percent }

    @billings_amount = Fm::Billing.sum("amount")
    @incomes_amount = Fm::Income.sum("amount")

    render
  end

  def projects
    @plans_situation_chart = Pm::Plan.situation_chart  
    @projects_situation_chart = Pm::Project.situation_chart 
    @activities_situation_chart = Pm::Projects::Activity.situation_chart 

    @gantt_data = Pm::Plan.gantt

    @plan_counts = Pm::Plan.count
    @project_counts = Pm::Project.count
    @activity_counts = Pm::Projects::Activity.count

    @lasted_plans = Pm::Plan.includes(:manager).where(approved: 1).order("planned_started_at DESC").limit(10)
    @lasted_projects = Pm::Project.includes(:manager).order("planned_started_at DESC").limit(10)
    @lasted_projects_activities = Pm::Projects::Activity.includes(:user).order("time DESC").limit(10)
    
    render
  end

end
