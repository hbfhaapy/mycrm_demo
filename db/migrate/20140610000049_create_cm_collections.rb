class CreateCmCollections < ActiveRecord::Migration
  def change
    create_table :cm_collections do |t|
      t.string :name
      t.datetime :percent
      t.datetime :time
      t.integer :contact_id
      t.references :user_id, index: true

      t.timestamps
    end
  end
end
