class ChangeCrmActivities < ActiveRecord::Migration
  def change
    change_table :crm_activities do |t|
      t.remove :activityable_type
      t.string :activityable_type
    end    
  end

end
