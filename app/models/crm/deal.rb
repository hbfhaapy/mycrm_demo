class Crm::Deal < ActiveRecord::Base
  belongs_to :category, class_name: "Crm::Deal::Category"
  belongs_to :status, class_name: "Crm::Deal::Status"
  belongs_to :contact, counter_cache: true, touch: true
  belongs_to :company, counter_cache: true, touch: true
  belongs_to :user, class_name: "User"

  has_many :activities, :as => :activityable, :dependent => :destroy
  has_many :pricelists, class_name: "Crm::Deal::Pricelist", :dependent => :destroy

  validates :amount, :status_id, :time, :category_id, :name, presence: true
end
