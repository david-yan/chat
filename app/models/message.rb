class Message < ActiveRecord::Base
	belongs_to :chatroom
	belongs_to :user

	def tojson
		{body: self.body, user: self.user.name}
	end
end
