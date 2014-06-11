class Crm::Deal < ActiveRecord::Base
  belongs_to :category, class_name: "Crm::Deal::Category"
  belongs_to :status, class_name: "Crm::Deal::Status"
  belongs_to :contact, counter_cache: true, touch: true
  belongs_to :company, counter_cache: true, touch: true
  belongs_to :user, class_name: "User"

  has_many :activities, :as => :activityable, :dependent => :destroy
  has_many :plans, class_name: "Pm::Plan", :dependent => :destroy
  has_many :pricelists, class_name: "Crm::Deal::Pricelist", :dependent => :destroy

  validates :amount, :status_id, :time, :category_id, :name, :presence => true

  def self.situation_chart
    deals_hash = Crm::Deal.joins(:status).group("properties.name").size
    deals_count = Crm::Deal.all.size

    deals_hash.each { |k, v| deals_hash[k] = format("%.2f", v*100/deals_count.to_f).to_i }

    chart = LazyHighCharts::HighChart.new('deals_situation') do |f|
      f.title({  text: '商机状态情况',
                 x: -20
      })
      f.exporting({enabled: true, enableImages: true, filename: "#{Time.now.strftime "%Y-%m-%d"}-销售人员情况", sourceWidth: 1024, sourceHeight: 400})
      f.credits( text: "by旺田云", href: "http://netfarmer.com.cn")
      f.colors(['#F0596B', '#4DB6C5', '#FB6A3F', '#1EBBA6', '#958378', '#05B2D2'])
      f.tooltip({
        valueSuffix: '%'
      })
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 20, 20, 20]})
      series = {
               :type=> 'pie',
               :name=> '占',
               :data=> deals_hash.to_a
      }
      f.series(series)
      f.options[:title][:text] = "商机状态分布"
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'})
      f.plot_options(:pie=>{
        :allowPointSelect=>true,
        :cursor=>"pointer" ,
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"12px Arial"
          }
        }
      })
    end
  end

  def basic_line_chart
    activities_data = self.activities.by_year.where("MONTH(created_at) in (?)", (1..12)).group("MONTH(created_at)").size

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
      f.title({  text: '商机活跃度',
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
