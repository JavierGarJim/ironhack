
require('colorize')


class WordChain
	def initialize(dictionary)
		@dictionary = dictionary
	end

	def resolve_puzzle(start_word, end_word)
		@start_word = start_word
		@end_word = end_word
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
		puts "#{@iteration}. #{@start_word}"
		
		@iteration += 1

		last = (@word_length - 1)

		(0..last).each do |i|
			if @start_word[i] != @end_word[i]
				temp_letter = @start_word[i]

				@start_word[i] = @end_word[i]

			 	if @dictionary.exists(@start_word)
					change_letter()

					return
				else
					@start_word[i] = temp_letter
				end
			end
		end

		if @start_word != @end_word
			(0..last).each do |i|
				new_word = @dictionary.get_similar_word(@start_word, i)

				if !new_word.nil?
					@start_word = new_word

					change_letter()

					return
				end
			end

			puts "\nFailed!\n\n"
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
end
