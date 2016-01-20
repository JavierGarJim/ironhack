
class Calculator
	@@operators = {
		:add => 		"+",
		:substract =>	"-",
		:multiply => 	"*",
		:divide =>		"/", 
	}

	def self.operators
		@@operators
	end
end