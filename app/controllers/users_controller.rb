# Users are people who have an account. This is different from People.
# People belong to families and their data is collected by hand.
class UsersController < ApplicationController

  before_action :authorize, :except => [:new, :create, :login, :home]

  def user_params
    params.require(:user).permit(:email, :password, :full_name, :is_admin)
  end

  def show
    # User dashboard.
    @user = User.find(params[:id])
    @users = User.all
  end

  def dash
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def home
     user ||= User.find(session[:user_id]) if session[:user_id]
     if user.nil?
        redirect_to home_path
     else
        redirect_to dash_path
     end
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

  def logout
    session.delete(:user_id)
    redirect_to home_path
  end
  
  def login
    
    # Get email and password.
    user_email = params[:user][:email]
    user_pw = params[:user][:password]
    
    # Attempt to find the user. If not found, then return to home page.
    @user = User.find_by(email: user_email)

    if @user == nil
      flash[:notice] = "Could not find #{user_email}, try again."
      redirect_to home_path
    else
      
      # Check that passwords match.
      if user_pw == @user.password
        session[:user_id] = @user.id
        redirect_to dash_path
      else
        flash[:notice] = "Wrong password for #{user_email}, try again."
        redirect_to home_path
      end
    end
  end
end
