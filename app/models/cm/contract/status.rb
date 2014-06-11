class Cm::Contract::Status < Property
  has_many :contracts, class_name: "Cm::Contract", :dependent => :destroy
end
