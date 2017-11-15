class RemoveActivitiesFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :activities, :string
  end
end
