class SubmittalsController < ApplicationController

	def submittal_params
		params.require(:submittal).permit(:title, :notes, :family_id)
	end

	def new
        @family = Family.find(params[:family_id])
        @users = User.all
	end

	def show
        @user ||= User.find(session[:user_id]) if session[:user_id]
		@submittal = Submittal.find(params[:id])
	end

	def edit
		@family = Family.find(params[:family_id])
    	@submittal = Submittal.find(params[:id])
        @users = User.all
        # Include all users
	end

	def update 
		@submittal = Submittal.find(params[:id])
    	@submittal.update_attributes!(submittal_params)
    	@family = Family.find_by(params[:family_id])
        user = User.find(params[:user][:id])
        if !params[:task].nil?
            task_title, task_notes = params[:task][:title], params[:task][:notes] 
            completed = params[:task_completed].nil? ? false : true
            if !task_title.nil? and !task_notes.nil? and !task_title.empty? and !task_notes.empty?
                @task = Task.create!(:title => task_title, :notes => task_notes, :completed => completed)
                user.managements << Management.new(:task_id => @task.id, :user_id => user.id)
                user.save!
              # @task = Task.create!(task_params.merge(:users => [User.first, User.second]))
            end
        end
    	flash[:notice] = "Submittal for #{@family.family_name} was successfully updated."
    	redirect_to family_path(@family)
	end 

	def index
		@user ||= User.find(session[:user_id]) if session[:user_id]
		@family = Family.find_by(params[:family_id])
    	@submittals = @family.submittals
	end

    def create
        @family = Family.find(params[:family_id])
        title, notes = submittal_params[:title], submittal_params[:notes]
        if !title.nil? and !notes.nil? and !title.empty? and !notes.empty?
            @family.submittals.build(submittal_params.merge(:family_name => @family.family_name)).save!
            # Tasks, need to change to handle multiple tasks later
			# currently we could do,
			# :users => params[:task][:task_users] where params[:task][:task_users] is an array of User objects
			# but params[:task][:task_users] front-end isn't there to handle User objects

			# task_title, task_notes = task_params["title"], task_params["notes"]
			# if !task_title.nil? and !task_notes.nil? and !task_title.empty? and !task_notes.empty?
			# end
            user = User.find(params[:user][:id])
            if !params[:task].nil?
                task_title, task_notes = params[:task][:title], params[:task][:notes] 
                completed = params[:task_completed].nil? ? false : true
                if !task_title.nil? and !task_notes.nil? and !task_title.empty? and !task_notes.empty?
                    @task = Task.create!(:title => task_title, :notes => task_notes, :completed => completed)
                    user.managements << Management.new(:task_id => @task.id, :user_id => user.id)
                    user.save!
                end
            end 

            redirect_to family_path(@family), :flash => { :success => "Submittal successfully created for family: #{@family.family_name}"}
        else
            redirect_to new_family_submittal_path(@family.id), :flash => { :error => "Please fill out all fields"}
        end
    end

     def destroy
        submittal = Submittal.find_by_id_and_family_id(params[:id], params[:family_id])
        submittal.destroy!
    end

    def approve
        @user ||= User.find(session[:user_id]) if session[:user_id]
        if @user.can_revoke?
            submittal = Submittal.find(params[:submittal_id])
            submittal.approve
            submittal.save!
            redirect_to family_path(params[:family_id]), :flash => { success: "Submittal was successfully approved."}
        else
            redirect_to family_path(params[:family_id]), :flash => { error: "Unauthorized"}
        end
    end

    def revoke
        @user ||= User.find(session[:user_id]) if session[:user_id]
        if @user.can_revoke?
            submittal = Submittal.find(params[:submittal_id])
            submittal.revoke
            submittal.save!
            redirect_to family_path(params[:family_id]), :flash => { success: "Submittal was successfully revoked."}
        else
            redirect_to family_path(params[:family_id]), :flash => { error: "Unauthorized"}
        end
    end 

end
