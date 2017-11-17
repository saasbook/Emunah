class FamiliesController < ApplicationController
  
  def family_params
    params.require(:family).permit(:family_name)
  end

  def show
    @family = Family.find(params[:id])
    @people = @family.people
    @user ||= User.find(session[:user_id]) if session[:user_id]
    # TODO distinction between confidential user and regular user
  end

  def index
    @user ||= User.find(session[:user_id]) if session[:user_id]
    @families = Family.all
  end

  def new
    # Create form.
  end

  def new_person
    # Create form to add new person to family.
  end

  def add_person
    # If person already exists in family, error out. Else, add person to family.
    @family = Family.find(params[:id])
    person = @family.people.build(person_params)
    person.save!
    flash[:notice] = "#{person.full_name} was successfully added to #{@family.family_name}!"
    redirect_to edit_family_path
  end

  # If family already exists, error out. Else, create the family.
  def create
    family_name = params[:family][:family_name]
    family = Family.find_by(family_name: family_name)
    if family != nil
      flash[:notice] = "#{family_name} already exists."
    else
      @family = Family.create!(family_params)
      flash[:notice] = "#{@family.family_name} was successfully created."
    end
    redirect_to families_path
  end

  def edit
    @family = Family.find(params[:id])
    @people = @family.people
  end

  def update
    @family = Family.find(params[:id])
    @family.update_attributes!(family_params)
    flash[:notice] = "#{@family.family_name}'s family name was successfully updated."
    redirect_to families_path
  end

  def destroy
    Family.find(params[:id]).destroy
  end

end
