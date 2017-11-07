class SubmittalsController < ApplicationController

	def submittal_params
		params.require(:submittal).permit(:title, :notes)
	end

	def new
	end

	def create
		family = Family.find_by(family_name: params[:submittal][:family])
		submittal = family.submittals.build(title: params[:submittal][:title], notes: params[:submittal][:notes])
		submittal.save!
		flash[:notice] = "Submittal successfully created for family: #{family.family_name}"
		redirect_to home_path
	end
end
