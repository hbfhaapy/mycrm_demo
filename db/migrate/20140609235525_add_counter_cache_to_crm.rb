class AddCounterCacheToCrm < ActiveRecord::Migration
  def change
    add_column :crm_companies, :contacts_count, :integer, :default => 0
    add_column :crm_companies, :deals_count, :integer, :default => 0
    add_column :crm_contacts, :activities_count, :integer, :default => 0
    add_column :crm_contacts, :deals_count, :integer, :default => 0
    add_column :crm_deals, :activities_count, :integer, :default => 0
    
    Crm::Company.reset_column_information
    Crm::Company.all.each do |c|
      Crm::Company.where(id: c.id).update_all contacts_count: c.contacts.length, deals_count: c.deals.length
    end

    Crm::Contact.reset_column_information
    Crm::Contact.all.each do |c|
      Crm::Contact.where(id: c.id).update_all activities_count: c.activities.length, deals_count: c.deals.length
    end

    Crm::Deal.reset_column_information
    Crm::Deal.all.each do |c|
      Crm::Deal.where(id: c.id).update_all activities_count: c.activities.length
    end
  end
end
