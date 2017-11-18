class RemoveFullNameFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :full_name, :string
  end
end
