class Crm::Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
end
