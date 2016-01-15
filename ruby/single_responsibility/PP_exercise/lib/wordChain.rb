
require('colorize')


class WordChain
	def initialize(dictionary)
		@dictionary = dictionary
	end

	def resolve_puzzle(start_word, end_word)
		@start_word = start_word
		@start_word_array = start_word.chars.to_a
		@end_word = end_word
		@end_word_array = end_word.chars.to_a
		@word_length = start_word.length
		@iteration = 0

		puts "\nStarting Word-Chain #{@start_word} ==> #{@end_word}\n\n"

		if !initial_check()
			return

		end
		
		change_letter()

		puts "\nThe End!\n\n"
	end

	private
	def change_letter
		puts "#{@iteration}. #{@start_word_array.join}"
		
		@iteration += 1
		
		(0..(@word_length - 1)).each do |i|
			if !is_same_letter(i)				
				temp_letter = @start_word_array[i]

				@start_word_array[i] = @end_word_array[i]

			 	if @dictionary.exists(@start_word_array.join)
					change_letter()

					return
				else
					@start_word_array[i] = temp_letter
				end
			end
		end

		if @start_word_array.join != @end_word_array.join
			(0..(@word_length - 1)).each do |i|
				new_word = @dictionary.get_similar_word(@start_word_array.join, i)

				if !new_word.nil?
					@start_word_array = new_word.chars.to_a

					change_letter()

					return
				end
			end
		end
	end	




	private
	def initial_check
		if !@dictionary.exists(@start_word)
			puts "ERROR: start word _#{@start_word}_ is not a real word!!!".colorize(:red)

			return false
		end

		if !@dictionary.exists(@end_word)
			puts "ERROR: end word _#{@end_word}_ is not a real word!!!".colorize(:red)

			return false
		end		

		if @start_word.length != @end_word.length
			puts "ERROR: start word _#{@start_word}_ and end word _#{@end_word}_ is not the length!!!".colorize(:red)
		
			return false
		end

		true
	end

	private
	def is_same_letter(index)
		if @start_word_array[index] == @end_word_array[index]
			true
		else
			false
		end
	end
end
