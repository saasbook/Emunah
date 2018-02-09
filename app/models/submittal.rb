class Submittal < ApplicationRecord

	belongs_to :family
	has_many :managements
	def approve
		self.reviewed = true
	end

	def revoke
		self.reviewed = false
	end

end
