class PeopleController < ApplicationController
  
  def person_params
    params.require(:person).permit(:full_name, :hebrew_name, :birthday,
      :home_address, :telephone, :telephone_type, :email_address, :employer,
      :occupation, :anniversary, :is_child)
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
