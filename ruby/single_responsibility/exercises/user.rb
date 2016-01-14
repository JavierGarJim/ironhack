
class User
	attr_reader :username, :logged

	def initialize(username, password)
		@username = username
		@password = password
		@logged = false
	end

	def log_in(username, password)
		if username == @username && password == @password
			@logged = true
		else
			@logged = false
		end
	end
end