class FamiliesController < ApplicationController
  
  def family_params
    params.require(:family).permit(:family_name)
  end

  def show
    # Unused.
  end

  def index
    # User dashboard.
  end

  def new
    # Form to create. Admin only.
  end

  def create
    @family = Family.create!(family_params)
    flash[:notice] = "#{@family.family_name} was successfully created."
    redirect_to families_path
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
