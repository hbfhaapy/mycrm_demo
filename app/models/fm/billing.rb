class Fm::Billing < ActiveRecord::Base
  belongs_to :collection, class_name: "Cm::Collection"
  belongs_to :manager, class_name: "User"
  belongs_to :company, class_name: "Crm::Company"

  validates :amount, :collection_id, :manager_id, :time, :user_id, :company_id, :presence => true
end
