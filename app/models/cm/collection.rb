class Cm::Collection < ActiveRecord::Base
  by_star_field :time

  belongs_to :contract
  has_many :billings, class_name: "Fm::Billing", :dependent => :destroy
  has_many :incomes, class_name: "Fm::Income", :dependent => :destroy

  validates :name, :percent, :time, :user_id, :contract_id, :presence => true
  validate :new_percent_range, :on => :create
  validate :edit_percent_range, :on => :update

  def new_percent_range
  	if percent.present?
  	  current_percent = 0

  	  self.contract.collections.each { |c| current_percent += c.percent }
  	  if percent <= 0 || percent > (100 - current_percent)
  	    errors.add(:percent, "比例超出范围！")
  	  end
    end
  end

  def edit_percent_range
    if percent.present?
      current_percent = 0

      self.contract.collections.each { |c| (current_percent += c.percent) if c.id != self.id }

      if percent <= 0 || percent > (100 - current_percent)
        puts "#{percent} > (100 - #{current_percent})"
        errors.add(:percent, "比例超出范围！")
      end
    end
  end

  def self.situation_chart
    billings_data = Fm::Billing.by_year.where("MONTH(time) in (?)", (1..12)).group("MONTH(time)").sum("amount")
    incomes_data = Fm::Income.by_year.where("MONTH(time) in (?)", (1..12)).group("MONTH(time)").sum("amount")

    hash = {}

    (1..12).each { |a| hash.merge!(Hash[*[a, 0]]) }
    billings_hash = hash.merge(billings_data)
    incomes_hash = hash.merge(incomes_data)

    months = (1..12).to_a
    billings_counts = []
    incomes_counts = []

    billings_hash.each do |k, v|
      billings_counts << v
    end
    incomes_hash.each do |k, v|
      incomes_counts << v
    end

    chart = LazyHighCharts::HighChart.new('basic_line') do |f|
      f.chart({ type: 'column'})
      f.colors(['#F0596B', '#4DB6C5', '#FB6A3F', '#1EBBA6', '#958378', '#05B2D2'])
      f.credits( text: "by旺田云", href: "http://netfarmer.com.cn")
      f.title({  text: '财务情况',
                 x: -20
      })
      f.xAxis({
         categories: months.map { |a| "#{a}月" }
      })
      f.yAxis({
        title: {
          text: '金额(元)'
        },
        plotLines: [{
          value: 0,
          width: 1,
          color: '#808080'
        }],
        min: 0
      })
      f.tooltip({
        valueSuffix: '元',
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
          name: '开票金额',
          data: billings_counts
      })
      f.series({
          name: '到款金额',
          data: incomes_counts
      })
    end
  end
end
