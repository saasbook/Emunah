class CreateSubmittals < ActiveRecord::Migration[5.1]
  def change
    create_table :submittals do |t|
      t.integer :family_id
      t.string :title
      t.string :notes
      t.string :access_level
      t.integer :user_id

      t.timestamps
    end
  end
end
