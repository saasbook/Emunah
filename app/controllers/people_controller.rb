class PeopleController < ApplicationController

  def show
    @person = Person.find(params[:id])
  end

  def index
    # Unused. 
  end

  def new
    # Form to create. Admin only.
    
  end

  def create
    
  end

  def edit
    # Admin only.
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
    Person.find(params[:id]).destroy
  end

end
