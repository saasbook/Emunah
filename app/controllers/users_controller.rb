# Users are people who have an account. This is different from People.
# People belong to families and their data is collected by hand.
class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:email, :password, :full_name, :status)
  end

  def show
    # User dashboard.
    @user = User.find(params[:id])
    @users = User.all
  end

  def index
    # Unused.
  end

  def new
    # Generates form.
  end

  def create
    @user = User.create!(user_params)
    if @user == nil
      flash[:notice] = "Could not create #{@user.full_name}"
    else
      flash[:notice] = "#{@user.full_name} was successfully created."
    end
    redirect_to users_path
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
  
  def login
    
    # Get email.
    user_email = params[:user][:email]
    
    # Hacky workaround for unimplemented login yet. Pretend to login to Seth.
    if user_email == 'test'
      redirect_to users_path
    else
      
      # Attempt to find the user. If not found, then return to home page.
      @user = User.find_by(email: user_email)
      if @user == nil
        flash[:notice] = "Could not find #{user_email}, try again."
        redirect_to home_path
      else
        
        # TODO: Check that passwords match. Right now, it logs in regardless.
        redirect_to user_path(@user)
      end
    end
  end
end
