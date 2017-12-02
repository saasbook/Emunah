class AddFamilyNameToSubmittals < ActiveRecord::Migration[5.1]
  def change
    add_column :submittals, :family_name, :string
  end
end
