class SubmittalsController < ApplicationController

	def submittal_params
		params.require(:submittal).permit(:title, :notes)
	end

	def new
	end

	def show
		@submittal = Submittal.find(params[:id])
	end

	def edit
		@family = Family.find(params[:family_id])
    	@submittal = Submittal.find(params[:id])
	end

	def index
		@user ||= User.find(session[:user_id]) if session[:user_id]
		@family = Family.find_by(params[:family_id])
    	@submittals = @family.submittals
	end

	def create
		@family = Family.find(params[:family_id])
		@family.submittals.build(submittal_params).save!
		flash[:notice] = "Submittal successfully created for family: #{@family.family_name}"
		redirect_to family_path(@family)
	end
end
