# Users are people who have an account. This is different from People.
# People belong to families and their data is collected by hand.
class UsersController < ApplicationController

  before_action :authorize, :except => [:new, :create, :login, :home]

  def user_params
    params.require(:user).permit(:email, :password, :full_name, :role)
  end

  def show

  end

  def index
    @user ||= User.find(session[:user_id]) if session[:user_id]
    if @user.role === "admin"
      @users = User.all.select(User.attribute_names - ['password', 'password_digest'])
    else
      redirect_to home_path
    end
  end

  def new
    # Generates form.
  end

  def create
    begin
      @user = User.create!(user_params)
      if @user != nil
        flash[:notice] = "#{@user.full_name} was successfully created."
      end
    rescue ActiveRecord::RecordInvalid => e
      flash[:notice] = "Could not create user. #{e.message[19..-1]}."
    end
    redirect_to new_user_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.full_name} was successfully updated."
    redirect_to users_path
  end

  def destroy
    User.find(params[:id]).destroy
  end
  
end
