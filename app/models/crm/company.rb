class Crm::Company < ActiveRecord::Base
  attr_accessor :uploader_secure_token
  mount_uploader :image, AvatarUploader

  belongs_to :category, class_name: "Crm::Company::Category"
  has_many :phones, :as => :phoneable, :dependent => :destroy
  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :contacts, :dependent => :destroy
  has_many :deals, :dependent => :destroy
  has_many :contracts, class_name: "Cm::Contract"
  has_many :incomes, class_name: "Fm::Income"
  has_many :billings, class_name: "Fm::Billing"
  has_many :plans, class_name: "Pm::Plan"

  accepts_nested_attributes_for :phones, reject_if: :reject_phones, :allow_destroy => true
  accepts_nested_attributes_for :addresses, reject_if: :reject_addresses, :allow_destroy => true

  validates :category_id, :name, :presence => true

  def reject_phones(attributed)
    attributed['number'].blank? || attributed['klass_id'].blank?
  end

  def reject_addresses(attributed)
    attributed['content'].blank?
  end

  def basic_line_chart
    deals_data = self.deals.by_year.where("MONTH(created_at) in (?)", (1..12)).group("MONTH(created_at)").size
    contracts_data = self.contracts.by_year.where("MONTH(signed_at) in (?)", (1..12)).group("MONTH(signed_at)").size

    hash = {}

    (1..12).each { |a| hash.merge!(Hash[*[a, 0]]) }
    deals_hash = hash.merge(deals_data)
    contracts_hash = hash.merge(contracts_data)

    months = (1..12).to_a
    deal_counts = []
    contract_counts = []

    deals_hash.each do |k, v|
      deal_counts << v
    end
    contracts_hash.each do |k, v|
      contract_counts << v
    end

    chart = LazyHighCharts::HighChart.new('basic_line') do |f|
      f.chart({ type: 'column'})
      f.colors(['#F0596B', '#4DB6C5', '#FB6A3F', '#1EBBA6', '#958378', '#05B2D2'])
      f.title({  text: '客户活跃度',
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
          name: '合同',
          data: contract_counts
      })
    end
  end
end
