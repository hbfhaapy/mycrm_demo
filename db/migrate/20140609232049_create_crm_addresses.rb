class CreateCrmAddresses < ActiveRecord::Migration
  def change
    create_table :crm_addresses do |t|
      t.string :content
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
