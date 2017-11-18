class AddDiscoveryToFamilies < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :discovery, :string
  end
end
