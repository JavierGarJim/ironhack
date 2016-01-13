
require 'colorize'


class Movie
	attr_accessor :title, :rating
	def initialize(title, rating)
		@title = title
		@rating = rating
	end	
end


class NewRating
	def initialize
		@movies = []
		@max_rating = 0

		file = File.open("movies.txt", "r")
		  while (title = file.gets)
		  	rating = rand(1...10)

		  	new_movie = Movie.new(title, rating)

		  	if rating > @max_rating
				@max_rating = rating
		  	end

			@max_rating = 10

		    @movies.push(new_movie) 
		  end
		file.close
	end

	def show_rating
		r = @max_rating

		while ( r >= 0 )
			@movies.each do
				| movie |
				print "|".colorize(:blue)

				if movie.rating >= r
					print "#".colorize(:green)
				else
					print " "
				end
			end
				
			puts "|".colorize(:blue)

			r -= 1
		end

		(1..@movies.length).each do
			print "--"
		end
		
		puts "-"

		(1..@movies.length).each_with_index do
			| i |
			print "|"
			print "#{i}".colorize(:red)
		end

		puts "|"
		puts ""

		@movies.each_with_index do
			| movie, i |

			index = i + 1
			print "#{index}.\t".colorize(:red)
			print "#{movie.title}".colorize(:white)
		end

		puts ""
	end
end


NewRating.new.show_rating

