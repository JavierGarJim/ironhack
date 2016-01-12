
# lib/car.rb

class Car
	attr_accessor(:make, :color)

	def initialize(make, color)
		@make = make
		@color = color
	end

	def start_engine
		puts "Starting engine of #{@make}...\n"

		case @make
			when "Honda"
				puts "Br Br Br Broom!"
			when "Ferrari"
				puts "BR BROOOOOOOM!!!"
		else
			puts "BROOM!"
		end

		puts ""
	end
end
