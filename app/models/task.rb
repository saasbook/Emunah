class Task < ApplicationRecord
	has_many :managements
	has_many :users, through: :managements
end
