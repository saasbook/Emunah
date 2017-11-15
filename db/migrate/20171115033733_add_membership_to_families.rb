class AddMembershipToFamilies < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :membership, :string
  end
end
