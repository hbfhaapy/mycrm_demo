class CreateCrmActivities < ActiveRecord::Migration
  def change
    create_table :crm_activities do |t|
      t.string :name
      t.integer :status_id
      t.integer :category_id
      t.references :user, index: true
      t.string :note
      t.integer :activityable_id
      t.integer :activityable_type
      t.datetime :time
      t.integer :person_id

      t.timestamps
    end
  end
end
