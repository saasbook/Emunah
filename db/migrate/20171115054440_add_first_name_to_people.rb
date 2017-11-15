class AddFirstNameToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :first_name, :string
  end
end
