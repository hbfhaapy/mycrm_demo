class Crm::Contact::Status < Property
  has_many :contacts, class_name: "Crm::Contact", :dependent => :destroy
end
