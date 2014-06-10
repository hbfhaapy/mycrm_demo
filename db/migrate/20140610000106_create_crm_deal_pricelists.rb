class CreateCrmDealPricelists < ActiveRecord::Migration
  def change
    create_table :crm_deal_pricelists do |t|
      t.text :content
      t.boolean :dealed
      t.integer :deal_id
      t.integer :user_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
