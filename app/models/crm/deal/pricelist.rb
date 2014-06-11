class Crm::Deal::Pricelist < ActiveRecord::Base
  serialize :content, Hash
  validates :content, :deal_id, :user_id, :contact_id, :presence => true

  MODEL = {
  			"name" => "设计费用-汇总",
  			"overall" =>
  			{
		  		"name" => "总体规划",
   				"price" => 0,
   				"area" => 0,
		  		"l1" =>
		  		{
		  			"name" => "概念规划",
		  			"area" => 0,
		  			"unitprice" => 0,
		  			"area" => 0,
		  			"price" => 0
		  		},
		  		"l2" =>
		  		{
		  			"name" => "一期规划深化",
		  			"area" => 0,
		  			"unitprice" => 0,
		  			"area" => 0,
		  			"price" => 0
		  		}
  			},
  			"plan" =>
  			{
		  		"name" => "一期单体设计（方案-建筑扩初）",
   				"price" => 0,
   				"area" => 0,
		  		"l1" =>
		  		{
		  			"name" => "住宅（高层/小高层）-地上",
		  			"area" => 0,
		  			"unitprice" => 0,
		  			"area" => 0,
		  			"price" => 0
		  		},
		  		"l2" =>
		  		{
		  			"name" => "洋房-地上",
		  			"area" => 0,
		  			"unitprice" => 0,
		  			"area" => 0,
		  			"price" => 0
		  		},
		  		"l3" =>
		  		{
		  			"name" => "配套商业-地上",
		  			"area" => 0,
		  			"unitprice" => 0,
		  			"area" => 0,
		  			"price" => 0
		  		},
		  		"l4" =>
		  		{
		  			"name" => "地下",
		  			"area" => 0,
		  			"unitprice" => 0,
		  			"area" => 0,
		  			"price" => 0
		  		}
  			},
  			"implement" =>
  			{
		  		"name" => "一期单体设计（施工图）",
   				"price" => 0,
   				"area" => 0,
		  		"l1" =>
		  		{
		  			"name" => "住宅（高层/小高层）-地上",
		  			"area" => 0,
		  			"unitprice" => 0,
		  			"area" => 0,
		  			"price" => 0
		  		},
		  		"l2" =>
		  		{
		  			"name" => "洋房-地上",
		  			"area" => 0,
		  			"unitprice" => 0,
		  			"area" => 0,
		  			"price" => 0
		  		},
		  		"l3" =>
		  		{
		  			"name" => "配套商业-地上",
		  			"area" => 0,
		  			"unitprice" => 0,
		  			"area" => 0,
		  			"price" => 0
		  		},
		  		"l4" =>
		  		{
		  			"name" => "地下",
		  			"area" => 0,
		  			"unitprice" => 0,
		  			"area" => 0,
		  			"price" => 0
		  		}
  			}
		  }
end
