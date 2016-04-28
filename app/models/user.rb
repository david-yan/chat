class User < ActiveRecord::Base

	@@keep_alive_time = 5.seconds

	def alive?
		return Rails.cache.exist?(self.name)
	end

	def keep_alive
		Rails.cache.write(self.name, true, timeToLive: @@keep_alive_time)
	end
end
