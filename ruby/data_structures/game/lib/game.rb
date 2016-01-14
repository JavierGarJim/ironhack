# Start game method
# Change room method
# Add room method
# An array of rooms
class Game
	def initialize
		@rooms = []
		@current_room = 0
	end

	def add_room(single_room)
		@rooms.push(single_room)
	end

	def play
		user_input = ""

		while user_input != @rooms[@current_room].exit
			@rooms[@current_room].display_description
			user_input = gets.chomp
		end

		@current_room += 1
		if @current_room != @rooms.length
			play
		end
	end
end