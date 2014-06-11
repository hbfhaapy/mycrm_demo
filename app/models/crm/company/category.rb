class Crm::Company::Category  < Property
  has_many :companies, class_name: "Crm::Company", :dependent => :destroy
end
