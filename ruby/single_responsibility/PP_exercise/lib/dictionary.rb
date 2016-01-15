
require 'active_support/inflector'


class Dictionary
	def initialize
		@words = {}

		File.open("/usr/share/dict/words") do |file|
		  	file.each do |line|
		    	@words[line.strip.downcase] = true
		    	@words[line.strip.downcase.pluralize] = true
		  	end
		end
	end

	def exists(word)
		!@words[word].nil?
	end

	def get_similar_word(initial_word, skipped_index)
		puts "Getting similar word to #{initial_word} (i = #{skipped_index})..."

		found_word = @words.find do |word|
			compare_similar_word(initial_word, word[0], skipped_index)
		end

		if !found_word.nil?
			# puts "Found #{found_word[0]}"

			found_word[0]
		end
	end

	private
	def compare_similar_word(initial_word, new_word, skipped_index)
		if initial_word.length == new_word.length
			# puts "Comparing #{initial_word} with #{new_word}..."

			initial_word.each_char.with_index do |letter, i|
				if i == skipped_index
					if letter == new_word[i]
						return false
					end
				else
					if letter != new_word[i]
						return false
					end
				end
			end

			true
		else
			false
		end
	end
end