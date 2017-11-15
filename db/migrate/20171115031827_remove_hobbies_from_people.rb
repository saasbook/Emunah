class RemoveHobbiesFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :hobbies, :string
  end
end
