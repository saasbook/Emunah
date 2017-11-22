class SubmittalsController < ApplicationController

	def submittal_params
		params.require(:submittal).permit(:title, :notes)
	end

	def new
		@family = Family.find(params[:family_id])
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
		params = submittal_params
		if !params[:title].empty? and !params[:notes].empty?
			@family.submittals.build(submittal_params.merge(:family_name => @family.family_name)).save!
			redirect_to family_path(@family), :flash => { :success => "Submittal successfully created for family: #{@family.family_name}"}
		else
			redirect_to new_family_submittal_path(@family.id), :flash => { :error => "Please fill out all fields"}
		end
	end

	def destroy
		family = Submittal.find_by_id_and_family_id(params[:id], params[:family_id])
		family.destroy!
	end
end
