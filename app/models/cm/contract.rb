class Cm::Contract < ActiveRecord::Base
  belongs_to :company, class_name: "Crm::Company"
  belongs_to :plan, class_name: "Pm::Plan"
  belongs_to :user, class_name: "User"
  belongs_to :agent, class_name: "User"
  belongs_to :status, class_name: "Cm::Contract::Status"
  has_many :collections, :dependent => :destroy

  validates_uniqueness_of :name
  validates :agent_id, :amount, :company_id, :ended_at, :name, :plan_id, :signed_at, :started_at, :status_id, :user_id, :presence => true


  def self.situation_chart
    contracts_hash = self.joins(:status).group("properties.name").size
    contracts_count = self.all.size

    contracts_hash.each { |k, v| contracts_hash[k] = format("%.2f", v*100/contracts_count.to_f).to_i }

    chart = LazyHighCharts::HighChart.new('contracts_situation') do |f|
      f.title({  text: '合同状态情况',
                 x: -20
      })
      f.exporting({enabled: true, enableImages: true, filename: "#{Time.now.strftime "%Y-%m-%d"}-合同状态情况", sourceWidth: 1024, sourceHeight: 400})
      f.credits( text: "by旺田云", href: "http://netfarmer.com.cn")
      f.colors(['#F0596B', '#4DB6C5', '#FB6A3F', '#1EBBA6', '#958378', '#05B2D2'])
      f.tooltip({
        valueSuffix: '%'
      })
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 20, 20, 20]})
      series = {
               :type=> 'pie',
               :name=> '占',
               :data=> contracts_hash.to_a
      }
      f.series(series)
      f.options[:title][:text] = "合同状态分布"
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
end
