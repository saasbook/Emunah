class HomeController < ApplicationController
  
  def home_params
    params.require(:user).permit(:email, :password)
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
    # @user = User.where(home_params.)
    # flash[:notice] = 
    # redirect_to users_path
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
