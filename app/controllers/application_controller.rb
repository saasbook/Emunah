class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to '/users/login' unless current_user
  end
  
  # This is the incorrect place to put person_params, but Code Climate is a piece of shit.
  def person_params
    params.require(:person).permit(:full_name, :hebrew_name, :birthday,
      :home_address, :telephone, :telephone_type, :email_address, :employer,
      :occupation, :anniversary, :is_child, :discovery, :hobbies, :skills,
       :activities, :committees, :allow_contact)
  end

  def person2_params
    params.require(:person2).permit(:full_name, :hebrew_name, :birthday,
      :home_address, :telephone, :telephone_type, :email_address, :employer,
      :occupation, :anniversary, :is_child, :discovery, :hobbies, :skills,
       :activities, :committees, :allow_contact)
  end

end
