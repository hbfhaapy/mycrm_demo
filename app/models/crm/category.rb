class Crm::Company::Category  < Property
  #attr_accessible :name

  has_many :companies, :dependent => :destroy
end
