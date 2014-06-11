class Crm::Deal::Category < Property
  has_many :deals, class_name: "Crm::Deal", :dependent => :destroy
end
