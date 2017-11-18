class SubmittalsController < ApplicationController

	def submittal_params
		params.require(:submittal).permit(:title, :notes)
	end

	def new
	end

	def create
		@family = Family.find_by(params[:family_id])
		family = Family.find_by(family_name: params[:submittal][:family])
		if family == nil
			flash[:notice] = "Need to fill in the family field."
			redirect_to family_path(@family)
		else
			submittal = family.submittals.build(title: params[:submittal][:title], notes: params[:submittal][:notes])
			submittal.save!
			flash[:notice] = "Submittal successfully created for family: #{family.family_name}"
			redirect_to family_path(@family)
		end
	end
end
