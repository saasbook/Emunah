class ChangeIsAdminToRoleInUsers < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :is_admin, :role
  end
end
