

# lib/flying_car.rb

class FlyingCar < Car
	def  start_engine
		puts "Checking systems..."
		
		super
	end

	def  fly
		puts "Start flying..."
		puts "Up! Up! and Away!"
		puts ""
	end
end
