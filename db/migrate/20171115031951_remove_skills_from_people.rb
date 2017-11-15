class RemoveSkillsFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :skills, :string
  end
end
