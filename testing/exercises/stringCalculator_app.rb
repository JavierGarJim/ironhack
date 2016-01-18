
require_relative("StringCalculator.rb")


my_calc = StringCalculator.new

p my_calc.add("1,200") == 201
p my_calc.add("4,7") == 11
p my_calc.add("1/2") == 3
p my_calc.add("4/7") == 11
p my_calc.add("1:2") == 3
p my_calc.add("4:7") == 11
p my_calc.add("10,10") == 20
p my_calc.add("") == 0
p my_calc.add("9") == 9
p my_calc.add("5") == 5