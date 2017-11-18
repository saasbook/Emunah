class AddSkillsToFamilies < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :skills, :string
  end
end
