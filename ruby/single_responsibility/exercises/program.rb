
class Program
	def initialize
		@users = []
	end

	def add_user(user)
		@users.push(user)
	end

	def run(username, password)
		@users.find do
			|user|

			user.log_in(username, password)

			if user.logged
				puts "Welcome back, #{user.username}!"

				puts "Please enter some text to count words:"
				text = gets.chomp

				puts "-----"

				puts "The entered text has #{text.split.length} words."
			else
				puts "WRONG! Get out of here!"
			end
		end
	end
end