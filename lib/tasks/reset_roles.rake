#encoding: UTF-8
namespace :db do
  desc "reset Roles"
  task :reset_roles => :environment do
    Role.destroy_all

    id = 0
    hash = [
      {id: "#{id+=1}", name: "管理员"},
      {id: "#{id+=1}", name: "管理用户"},

      {id: "#{id+=1}", name: "显示市场报表"},
      {id: "#{id+=1}", name: "显示项目报表"},
      {id: "#{id+=1}", name: "显示财务报表"},
      {id: "#{id+=1}", name: "显示组织架构"},

      {id: "#{id+=1}", name: "显示CRM导航"},
      {id: "#{id+=1}", name: "管理所有联系人"},
      {id: "#{id+=1}", name: "管理所有客户"},
      {id: "#{id+=1}", name: "管理所有商机"},
      {id: "#{id+=1}", name: "管理所有活动"},
      {id: "#{id+=1}", name: "管理私有联系人"},
      {id: "#{id+=1}", name: "管理私有客户"},
      {id: "#{id+=1}", name: "管理私有商机"},
      {id: "#{id+=1}", name: "管理私有活动"},

      {id: "#{id+=1}", name: "浏览所有联系人"},
      {id: "#{id+=1}", name: "浏览所有客户"},
      {id: "#{id+=1}", name: "浏览所有商机"},
      {id: "#{id+=1}", name: "浏览所有活动"},
      {id: "#{id+=1}", name: "浏览私有联系人"},
      {id: "#{id+=1}", name: "浏览私有客户"},
      {id: "#{id+=1}", name: "浏览私有商机"},
      {id: "#{id+=1}", name: "浏览私有活动"},

      {id: "#{id+=1}", name: "显示合同导航"},
      {id: "#{id+=1}", name: "管理所有合同"},
      {id: "#{id+=1}", name: "管理所有收款计划"},
      {id: "#{id+=1}", name: "管理私有合同"},
      {id: "#{id+=1}", name: "管理私有收款计划"},
      {id: "#{id+=1}", name: "浏览所有合同"},
      {id: "#{id+=1}", name: "浏览所有收款计划"},
      {id: "#{id+=1}", name: "浏览私有合同"},
      {id: "#{id+=1}", name: "浏览私有收款计划"},

      {id: "#{id+=1}", name: "显示财务导航"},
      {id: "#{id+=1}", name: "管理所有开票"},
      {id: "#{id+=1}", name: "管理所有到款"},
      {id: "#{id+=1}", name: "管理私有开票"},
      {id: "#{id+=1}", name: "管理私有到款"},
      {id: "#{id+=1}", name: "浏览所有开票"},
      {id: "#{id+=1}", name: "浏览所有到款"},
      {id: "#{id+=1}", name: "浏览私有开票"},
      {id: "#{id+=1}", name: "浏览私有到款"},

      {id: "#{id+=1}", name: "显示项目导航"},
      {id: "#{id+=1}", name: "管理所有项目"},
      {id: "#{id+=1}", name: "管理私有项目"},
      {id: "#{id+=1}", name: "浏览所有项目"},
      {id: "#{id+=1}", name: "浏览私有项目"},
      {id: "#{id+=1}", name: "管理所有子项"},
      {id: "#{id+=1}", name: "管理私有子项"},
      {id: "#{id+=1}", name: "浏览所有子项"},
      {id: "#{id+=1}", name: "浏览私有子项"},
      {id: "#{id+=1}", name: "管理所有阶段"},
      {id: "#{id+=1}", name: "管理私有阶段"},
      {id: "#{id+=1}", name: "浏览所有阶段"},
      {id: "#{id+=1}", name: "浏览私有阶段"},

      {id: "#{id+=1}", name: "管理所有里程碑"},
      {id: "#{id+=1}", name: "管理私有里程碑"},
      {id: "#{id+=1}", name: "管理所有项目活动"},
      {id: "#{id+=1}", name: "管理私有项目活动"},
      {id: "#{id+=1}", name: "浏览所有项目活动"},
      {id: "#{id+=1}", name: "浏览私有项目活动"},

      {id: "#{id+=1}", name: "显示设置导航"},

      {id: "#{id+=1}", name: "管理组织架构和公告"},
      {id: "#{id+=1}", name: "管理审核流程"},
      {id: "#{id+=1}", name: "管理所有属性"}
    ]

    hash.each do |a|

      values = "#{a[:id]}, '#{a[:name]}'"
      ActiveRecord::Base.connection.execute("INSERT INTO roles (id, name) VALUES (#{values})")
    end
  end
end