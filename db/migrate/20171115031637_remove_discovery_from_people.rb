class RemoveDiscoveryFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :discovery, :string
  end
end
