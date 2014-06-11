class Crm::Activity::Category < Property
  has_many :activities, class_name: "Crm:Activity", :dependent => :destroy
end
