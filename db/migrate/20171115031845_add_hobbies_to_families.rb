class AddHobbiesToFamilies < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :hobbies, :string
  end
end
