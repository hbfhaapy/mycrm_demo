class Crm::Deal::Status < Property
  has_many :deals, class_name: "Crm::Deal", :dependent => :destroy
end
