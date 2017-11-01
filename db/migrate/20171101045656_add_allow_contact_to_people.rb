class AddAllowContactToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :allow_contact, :string
  end
end
