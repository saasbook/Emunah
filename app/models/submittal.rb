class Submittal < ApplicationRecord
	belongs_to :family
	def approve
		self.reviewed = true
	end

	def revoke
		self.reviewed = false
	end

end
