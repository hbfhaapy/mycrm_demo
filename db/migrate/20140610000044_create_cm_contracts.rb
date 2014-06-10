class CreateCmContracts < ActiveRecord::Migration
  def change
    create_table :cm_contracts do |t|
      t.string :name
      t.float :amount
      t.float :actual_amount
      t.integer :status_id
      t.integer :agent_id
      t.datetime :signed_at
      t.datetime :started_at
      t.integer :company_id
      t.integer :plan_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
