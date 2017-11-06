module LoginHelper

	def login_admin
		login(1)
	end

	def login(id)
		user = User.find(id)
		request.session[:user_id] = user.id
	end

	def current_user
		User.find(request.session[:user_id])
	end

end