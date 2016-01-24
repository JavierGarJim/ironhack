
require "imdb"
require "random_word_generator"


class Search
	attr_reader :term, :results, :max_results, :number_of_results, :selected_movie_index


	def initialize
		@results = []
	end

	def find_by_term(term, max_results)
		@max_results = max_results
		@term = term

		search = Imdb::Search.new(term)

		@number_of_results = search.movies.length

		new_results = 0

	  	while (new_results < max_results) && (!search.movies.empty?) do
			random_movie_index = Random.new.rand(search.movies.length)

			movie = search.movies[random_movie_index]

  			unless movie.poster.nil? || movie.release_date.nil? || movie.director[0].nil?
  				@results.push(movie)

  				new_results += 1
  			end

			search.movies.delete_at(random_movie_index)
  		end
	end

	def find_random(max_results)
		while @results.length < max_results do
			random_term = RandomWordGenerator.word

			puts "Random term: #{random_term}"

			find_by_term(random_term, max_results)
		end

		@max_results = max_results
		@number_of_results = @max_results
		@term = ""
	end

	def select_random_movie
  		if @results.length > 1
  			@selected_movie_index = Random.new.rand(@results.length)
  		end

		puts "Selected movie index: #{@selected_movie_index}"
	end

	def get_release_date_question
		movie = @results[@selected_movie_index]

		"Which movie was released in #{movie.release_date}?"
	end
end