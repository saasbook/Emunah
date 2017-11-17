# This object serves as a static home page, and handles login and logout.
class HomeController < ApplicationController

  def index
    if session[:user_id] != nil
      redirect_to dash_path
    end
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
        @user.last_login = Date.current
        @user.save
        redirect_to dash_path
      else
        flash[:notice] = "Wrong password for #{user_email}, try again."
        redirect_to home_path
      end
    end
  end
  
  def dash
    @user ||= User.find(session[:user_id]) if session[:user_id]
    if @user == nil
      redirect_to home_path
    else
      @last_login = @user.last_login == nil ? Date.current : @user.last_login
      @last_login = @last_login.to_formatted_s(:long_ordinal)
    end
  end
  
  def logout
    session.delete(:user_id)
    redirect_to home_path
  end
end
