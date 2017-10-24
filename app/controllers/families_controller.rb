class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:family_name)
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
