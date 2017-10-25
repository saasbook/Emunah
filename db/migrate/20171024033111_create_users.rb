class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :full_name
      t.boolean :status

      t.timestamps
    end
  end
end
