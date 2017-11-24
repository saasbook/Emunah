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

	def update 
		@submittal = Submittal.find(params[:id])
    	@submittal.update_attributes!(submittal_params)
    	@family = Family.find_by(params[:family_id])
    	flash[:notice] = "Submittal for #{@family.family_name} was successfully updated."
    	redirect_to family_path(@family)
	end 

	def index
		@user ||= User.find(session[:user_id]) if session[:user_id]
		@family = Family.find_by(params[:family_id])
    	@submittals = @family.submittals
	end

	def create
		# Submittals
		@family = Family.find(params[:family_id])
		@family.submittals.build(submittal_params.merge(:family_name => @family.family_name)).save!
		flash[:notice] = "Submittal successfully created for family: #{@family.family_name}"
		# Tasks, need to change to handle multiple users later
		# We need to also look for boolean too.
		# currently we could do,
		# :users => params[:task][:task_users] where params[:task][:task_users] is an array of User objects
		# but params[:task][:task_users] front-end isn't there to handle User objects
		@task = Task.create!(task_params.merge(:users => [User.first, User.second], :completed => false))
		redirect_to family_path(@family)
	end
end
