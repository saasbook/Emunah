class ChangeDataTypeForBirthday < ActiveRecord::Migration[5.1]
  def change
  	change_column(:people, :birthday, :date)
  end
end
