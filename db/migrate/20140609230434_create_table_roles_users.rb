class CreateTableRolesUsers < ActiveRecord::Migration
  def change
    create_table :table_roles_users do |t|
      t.references :user, index: true
      t.references :role, index: true
    end
  end
end
