class Smartfinder < ActiveRecord::Base
  belongs_to :user
  validates :klass, :name, :url, :user_id, presence: true
end
