module MainHelper
	def current_user
		return User.find_by_name(cookies[:user])
	end
end
