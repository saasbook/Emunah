class AddColumnsToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :discovery, :string
    add_column :people, :hobbies, :string
    add_column :people, :skills, :string
    add_column :people, :activities, :string
    add_column :people, :committees, :string
  end
end
