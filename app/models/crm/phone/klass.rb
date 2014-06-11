class Crm::Phone::Klass < Property
  has_many :phones, class_name: "Crm::Phone"
end
