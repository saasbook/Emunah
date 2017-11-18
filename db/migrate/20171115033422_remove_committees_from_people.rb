class RemoveCommitteesFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :committees, :string
  end
end
