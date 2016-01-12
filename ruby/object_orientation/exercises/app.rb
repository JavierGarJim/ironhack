
require_relative("lib/car.rb")
require_relative("lib/flyingCar.rb")

puts "Nizar's car:"
nizars_car = Car.new("Honda", "Blue")
puts nizars_car.inspect

puts "Javi's car:"
javis_car = Car.new("Ferrari", "Red")
puts javis_car.inspect

puts "Newest's car:"
newest_car = FlyingCar.new("Apple", "White")
puts newest_car.inspect

# puts "Starting engines!\n"

# nizars_car.start_engine()
# javis_car.start_engine()
# newest_car.start_engine()
# newest_car.fly()