class CreateCrmDeals < ActiveRecord::Migration
  def change
    create_table :crm_deals do |t|
      t.string :name
      t.integer :status_id
      t.integer :category_id
      t.float :amount
      t.integer :company_id
      t.integer :contact_id
      t.integer :user_id
      t.datetime :time

      t.timestamps
    end
  end
end
