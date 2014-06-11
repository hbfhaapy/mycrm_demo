class Crm::Contact < ActiveRecord::Base
  attr_accessor :uploader_secure_token
  mount_uploader :image, AvatarUploader
  belongs_to :category, class_name: "Crm::Contact::Category"
  belongs_to :status, class_name: "Crm::Contact::Status"
  belongs_to :company, counter_cache: true, touch: true
  belongs_to :user, class_name: "User"
  has_many :deals, :dependent => :destroy
  has_many :phones, :as => :phoneable, :dependent => :destroy
  has_many :activities, :as => :activityable, :dependent => :destroy
  has_many :addresses, :as => :addressable, :dependent => :destroy
  #has_many :person_activities, :foreign_key => "person_id"

  after_update :leave_deals_for_company

  accepts_nested_attributes_for :phones, reject_if: :reject_phones, :allow_destroy => true
  accepts_nested_attributes_for :addresses, reject_if: :reject_addresses, :allow_destroy => true

  validates :category_id, :status_id, :name, :presence => true

  def reject_phones(attributed)
    attributed['number'].blank? || attributed['klass_id'].blank?
  end

  def reject_addresses(attributed)
    attributed['content'].blank?
  end

  def leave_deals_for_company
    if self.company_id
      count = self.deals.where(company_id: nil).size
      if count > 0
        if self.deals.where(company_id: nil).update_all(company_id: self.company_id)
          self.company.update_attributes(deals_count: (self.company.deals_count + count))
        end
      end
    end
  end

  def basic_line_chart
    deals_data = self.deals.by_year.where("MONTH(created_at) in (?)", (1..12)).group("MONTH(created_at)").size
    activities_data = self.activities.by_year.where("MONTH(time) in (?)", (1..12)).group("MONTH(time)").size

    hash = {}

    (1..12).each { |a| hash.merge!(Hash[*[a, 0]]) }
    deals_hash = hash.merge(deals_data)
    activities_hash = hash.merge(activities_data)

    months = (1..12).to_a
    deal_counts = []
    activity_counts = []

    deals_hash.each do |k, v|
      deal_counts << v
    end

    activities_hash.each do |k, v|
      activity_counts << v
    end


    chart = LazyHighCharts::HighChart.new('basic_line') do |f|
      f.chart({ type: 'spline'})
      f.colors(['#F0596B', '#4DB6C5', '#FB6A3F', '#1EBBA6', '#958378', '#05B2D2'])
      f.title({  text: '联系人活跃度',
                 x: -20
      })
      f.xAxis({
         categories: months.map { |a| "#{a}月" }
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
        valueSuffix: '个'
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
        name: '活动',
        data: activity_counts
      })
      f.series({
          name: '商机',
          data: deal_counts
      })
    end
  end
end
