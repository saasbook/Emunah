class FamiliesController < ApplicationController
  
  def family_params
    params.require(:family).permit(:family_name)
  end

  def show
    # Unused.
  end

  def index
    @families = Family.all
  end

  def new
    # Form to create. Admin only.
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
    redirect_to dash_path
  end

  def edit
    # Admin only.
  end

  def update
    # Do we even use this?
  end

  def destroy
    # Delete from DB.
  end
end
