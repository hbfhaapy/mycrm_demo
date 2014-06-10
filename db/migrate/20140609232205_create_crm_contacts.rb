class CreateCrmContacts < ActiveRecord::Migration
  def change
    create_table :crm_contacts do |t|
      t.string :name
      t.integer :category_id
      t.integer :company_id
      t.references :user, index: true
      t.string :mail
      t.string :qq
      t.string :msn
      t.string :job
      t.text :note
      t.string :image
      t.integer :status_id

      t.timestamps
    end
  end
end
