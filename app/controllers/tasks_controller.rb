class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
  end

  def index
    @tasks = User.find(params[:user_id]).tasks
  end

  def new
    # Form to create. Admin only.
  end

  def create
    # If person already exists in family, error out. Else, add person to family.
    @family = Family.find(params[:family_id])
    person = @family.people.build(person_params)
    person.save!
    flash[:notice] = "#{person.first_name} was successfully added to #{@family.family_name}!"
    redirect_to edit_family_path(@family)
  end
  
  def edit
    @family = Family.find(params[:family_id])
    @person = Person.find(params[:id])
  end

  def update
    # Admin only
    @person = Person.find(params[:id])
    @person.update_attributes!(person_params)
    @family = @person.family
    flash[:notice] = "#{@person.first_name} was successfully updated."
    redirect_to edit_family_path(@family)
  end
  
  def destroy
    Task.find(params[:id]).destroy
  end

end
