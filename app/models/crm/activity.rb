class Crm::Activity < ActiveRecord::Base
  belongs_to :category, class_name: "Crm::Activity::Category"
  belongs_to :status, class_name: "Crm::Activity::Status"
  belongs_to :activityable, :polymorphic => true, counter_cache: true, touch: true
  belongs_to :user, class_name: "User"
  belongs_to :person, class_name: "Contact"


  validates :name, :status_id, :category_id, :activityable_type, :time, :person_id, :presence => true

  def self.situation_chart
    activities_data = self.by_year.where("MONTH(time) in (?)", (1..12)).group("MONTH(time)").size

    hash = {}

    (1..12).each { |a| hash.merge!(Hash[*[a, 0]]) }
    activities_hash = hash.merge(activities_data)

    months = (1..12).to_a
    activity_counts = []

    activities_hash.each do |k, v|
      activity_counts << v
    end

    chart = LazyHighCharts::HighChart.new('basic_line') do |f|
      f.chart({ type: 'spline'})
      f.colors(['#F0596B', '#4DB6C5', '#FB6A3F', '#1EBBA6', '#958378', '#05B2D2'])
      f.credits( text: "by旺田云", href: "http://netfarmer.com.cn")
      f.title({  text: '年度活动情况',
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
    end
  end
end
