class MainController < ApplicationController
	def index
		@error_message = flash[:error_message]
	end

	def login
		user = User.where(name:params[:name]).first_or_create!
		if user.alive?
			flash[:error_message] = 'User is already logged in!'
			redirect_to '/'
		else
			cookies[:user] = user.name
			redirect_to '/lobby'
		end
	end
end
