class User < ActiveRecord::Base
  attr_accessor :uploader_secure_token, :login
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  validates :username, :uniqueness => true, :length => { :in => 2..20 },
            :format => { :with => /\A[\u4e00-\u9fa5a-zA-Z0-9]+\z/ }

  has_and_belongs_to_many :roles
  has_many :plans, class_name: "Pm::Plan"
  has_many :manage_plans, class_name: "Pm::Plan", foreign_key: "manager_id"
  has_and_belongs_to_many :major_manage_plans, class_name: "Pm::Plan", join_table: "plans_major_managers", foreign_key: "major_manager_id"
  has_many :manage_projects, class_name: "Pm::Project", foreign_key: "manager_id"
  has_many :manage_stages, class_name: "Pm::Projects::Stage", foreign_key: "manager_id"
  has_many :processes, class_name: "Checking::Process"
  has_many :notifications
  has_many :deals, class_name: "Crm::Deal"
  has_many :activities, class_name: "Crm::Activity"
  has_many :pm_activities, class_name: "Pm::Projects::Activity"
  has_many :contracts, class_name: "Cm:Contract"
  has_many :billings, class_name: "Fm::Billing"
  has_many :smartfinders
  belongs_to :organization

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.sale_people_situation_chart
    deals_hash = Crm::Deal.joins(:user).group("username").size
    activities_hash = Crm::Activity.joins(:user).group("username").size
    contracts_hash = Cm::Contract.joins(:agent).group("username").size

    usernames_hash = deals_hash.merge(activities_hash)
    usernames_hash.each {|k, v| usernames_hash[k] = 0 }

    deals_hash = usernames_hash.merge(deals_hash)
    activities_hash = usernames_hash.merge(activities_hash)
    contracts_hash = usernames_hash.merge(contracts_hash)

    names = []
    deal_counts = []
    activity_counts = []
    contract_counts = []

    deals_hash.each do |k, v|
      names << k
      deal_counts << v
    end
    activities_hash.each do |k, v|
      activity_counts << v
    end
    contracts_hash.each do |k, v|
      contract_counts << v
    end

    chart = LazyHighCharts::HighChart.new('sale_people_situation') do |f|
      f.chart({ type: 'column'})
      f.title({  text: '销售人员情况',
                 x: -20
      })
      f.exporting({enabled: true, enableImages: true, filename: "#{Time.now.strftime "%Y-%m-%d"}-销售人员情况", sourceWidth: 1024, sourceHeight: 400})
      f.credits( text: "by旺田云", href: "http://netfarmer.com.cn")
      f.colors(['#F0596B', '#4DB6C5', '#FB6A3F', '#1EBBA6', '#958378', '#05B2D2'])
      f.xAxis({
         categories: names
      })
      f.yAxis({
        title: {
          text: '数量(个)'
        },
        plotLines: [{
          value: 0,
          width: 1,
          color: '#808080'
        }],
        min: 0
      })
      f.tooltip({
        valueSuffix: '个',
        shared: true
      })
      f.legend({
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'top',
        x: -10,
        y: 100,
        borderWidth: 0
      })
      f.series({
          name: '商机',
          data: deal_counts
      })
      f.series({
          name: '活动',
          data: activity_counts
      })
      f.series({
          name: '合同',
          data: contract_counts
      })
    end
  end

  #开通账号
  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  def in_role?(role)
    if self.roles
      self.roles.collect(&:id).include?(role.to_i)
    end
  end

  def is_super_admin?
    self.id == 1
  end

  def has_role?(role)
    case role
      when :admin then in_role?("999")
      when :super_admin then is_super_admin?
      else false
    end
  end
end
