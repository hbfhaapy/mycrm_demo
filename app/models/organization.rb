class Organization < ActiveRecord::Base
  include TheSortableTree::Scopes
  acts_as_nested_set
  
  has_many :users
  
  validates :name, presence: true, uniqueness: true
  
  class << self
    def nested_set
      order(:lft)
    end
  end
end
