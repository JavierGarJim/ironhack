class Room
	attr_reader :exit

	def initialize(description, exit)
		@description = description
		@exit = exit
	end

	def display_description
		puts @description
	end
end