class Crm::Phone < ActiveRecord::Base
  belongs_to :klass
  belongs_to :phoneable, :polymorphic => true
end
