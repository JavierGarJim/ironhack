
require_relative("StringCalculator.rb")


RSpec.describe StringCalculator do
	it "returns 0 for empty string" do
		my_calc = StringCalculator.new
		expect(my_calc.add("")).to eq(0)
	end

	it "returns the number for one number" do
		my_calc = StringCalculator.new
		expect(my_calc.add("9")).to eq(9)
	end

	(0..10).each do |x|
		x1 = x
		x2 = x*x
		it "returns sum for #{x1},#{x2}" do
			my_calc = StringCalculator.new
			expect(my_calc.add("#{x1},#{x2}")).to eq(x1+x2)
		end
	end
end
