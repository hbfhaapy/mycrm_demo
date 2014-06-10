class CreateFmBillings < ActiveRecord::Migration
  def change
    create_table :fm_billings do |t|
      t.float :amount
      t.datetime :time
      t.integer :manager_id
      t.integer :company_id
      t.integer :collection_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
