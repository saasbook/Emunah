# This object serves as a static home page before login.
class HomesController < ApplicationController
  
  def home_params
    params.require(:user).permit(:email, :password)
  end

  def index
    # Render view.
  end
end
