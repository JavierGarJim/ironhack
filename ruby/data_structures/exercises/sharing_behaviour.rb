
# class Car
# 	def initialize(engine)
# 		@engine = engine
# 	end

# 	def start
# 		p "Pshhhhh"

# 		@engine.start
# 	end
# end

# class Engine
# 	def start

# 	end
# end

# class Engine1200
# 	def start
# 		p "Br Br Br Broom!"
# 	end
# end

# class Engine1600
# 	def start
# 		p "Br Broom!!"
# 	end
# end

# class Engine3000
# 	def start
# 		p "Brrooommm!!!"
# 	end
# end

# engine1 = Engine1200.new
# engine2 = Engine1600.new
# engine3 = Engine3000.new

# car1 = Car.new(engine1)
# car2 = Car.new(engine2)
# car3 = Car.new(engine3)

# car1.start
# car2.start
# car3.start

# -----------------------------------------

class Helicopter
	attr_reader :wheels, :sound

  	def initialize
    	@wheels = 3
    	@sound = "TuTuTuTu"
  	end
end

class MotorCycle
	attr_reader :wheels, :sound

  	def initialize
    	@wheels = 2
    	@sound = "BrBrBrBr"
  	end
end

class Car
	attr_reader :wheels, :sound

  	def initialize
    	@wheels = 4
    	@sound = "Broom"
  	end
end

class WheelCounter
	attr_reader :wheel_count

	def initialize
		# @vehicle_container = []
		@wheel_count = 0
	end
  
  	def add_vehicle(vehicle)
  		# @vehicle_container.puss(vehicle)

  		@wheel_count += vehicle.wheels
  	end
end

class SoundPlayer
	attr_reader :sounds

	def initialize
		# @vehicle_container = []
		@sounds = ""
	end
  
  	def add_vehicle(vehicle)
  		# @vehicle_container.puss(vehicle)

  		@sounds += vehicle.sound + "\n"
  	end
end


chopper = Helicopter.new
moto = MotorCycle.new
car = Car.new

wheelCounter = WheelCounter.new
wheelCounter.add_vehicle(chopper)
wheelCounter.add_vehicle(moto)
wheelCounter.add_vehicle(car)

soundPlayer = SoundPlayer.new
soundPlayer.add_vehicle(chopper)
soundPlayer.add_vehicle(moto)
soundPlayer.add_vehicle(car)

puts wheelCounter.wheel_count
puts soundPlayer.sounds
