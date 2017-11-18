class ChangeDataTypeForBirthday < ActiveRecord::Migration[5.1]
  def change
  	change_column :people, :birthday, "date USING (string_to_date(birthday, ','))"
  end
end
