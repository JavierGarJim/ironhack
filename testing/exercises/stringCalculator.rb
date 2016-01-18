
class StringCalculator
	def add(string)
		len = string.length
		half_len = len/2

		index_operator = string.chars.index do |c|
			!(Integer(c) rescue false)
		end

		if index_operator.nil?
			index_operator = 0
		end

		# puts index_operator

		if index_operator > 0
			string[0..index_operator-1].to_i + string[index_operator+1..len-1].to_i
		else
			string.to_i
		end
	end
end

