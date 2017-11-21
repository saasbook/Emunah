class ChangeDataTypeForBirthday < ActiveRecord::Migration[5.1]
  def change
  	change_column :people, :birthday, "date USING CAST(birthday AS date)"
  end
end
