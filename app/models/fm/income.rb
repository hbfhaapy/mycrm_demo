class Fm::Income < ActiveRecord::Base
  belongs_to :collection, class_name: "Cm::Collection"
  belongs_to :company, class_name: "Crm::Company"

  validates :amount, :collection_id, :time, :user_id, :company_id, :presence => true
end
