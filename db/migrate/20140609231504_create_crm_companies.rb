class CreateCrmCompanies < ActiveRecord::Migration
  def change
    create_table :crm_companies do |t|
      t.string :name
      t.integer :category_id
      t.integer :zipcode
      t.string :mail
      t.text :note
      t.string :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
