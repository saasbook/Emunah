class AddCommitteesToFamilies < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :committees, :string
  end
end
