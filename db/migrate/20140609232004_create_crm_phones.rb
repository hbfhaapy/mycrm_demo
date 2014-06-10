class CreateCrmPhones < ActiveRecord::Migration
  def change
    create_table :crm_phones do |t|
      t.integer :klass_id
      t.string :number
      t.integer :phoneable_id
      t.string :phoneable_type

      t.timestamps
    end
  end
end
