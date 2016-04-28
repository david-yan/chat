class LobbyController < ApplicationController
	def index
		@user = current_user
		@chatrooms = Chatroom.all
	end

	def chatroom
		@chatroom_id = params[:id]
	end

	def get_messages
		current_user.keep_alive
		render json: Chatroom.find(params[:id]).messages.map{|x| x.tojson}.to_json
	end

	def send_message
		Chatroom.find(params[:id]).messages.create(body: params[:body], user_id: current_user.id)
		render nothing: true, status: 200
	end
end
