class FamiliesController < ApplicationController
  
  def family_params
    params.require(:family).permit(:family_name)
  end

  def show
    @family = Family.find(params[:id])
  end

  def index
    @user ||= User.find(session[:user_id]) if session[:user_id]
    if @user.is_admin
      @families = Family.all
    end
  end

  def new
    # Create form.
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
  end

  def update
    @family = Family.find(params[:id])
    @family.update_attributes!(family_params)
    flash[:notice] = "#{@family.family_name}'s family name was successfully updated."
    redirect_to families_path
  end

  def destroy
    Family.destroy(params[:id])
    flash[:notice] = "Family deleted."
    redirect_to families_path
  end
end
