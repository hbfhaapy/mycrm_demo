class CreateFmIncomes < ActiveRecord::Migration
  def change
    create_table :fm_incomes do |t|
      t.float :amount
      t.datetime :time
      t.string :note
      t.integer :collection_id
      t.integer :company_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
