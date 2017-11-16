class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :full_name
      t.string :hebrew_name
      t.string :birthday
      t.string :home_address
      t.string :telephone
      t.string :telephone_type
      t.string :email_address
      t.string :employer
      t.string :occupation
      t.string :anniversary
      t.boolean :is_child

      t.timestamps
    end
  end
end
