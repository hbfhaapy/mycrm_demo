class CreateSmartfinders < ActiveRecord::Migration
  def change
    create_table :smartfinders do |t|
      t.string :url
      t.string :klass
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
