
require "sinatra"
require "sinatra/reloader" if development?
require_relative("lib/search.rb")


get "/" do
  erb(:home)
end

post "/search" do
	search_type = params[:search_type]
	max_results = params[:max_results].to_i

	if max_results == 0
		max_results = 4
	end

	@search = Search.new

	if search_type == "term"
		term = params[:term]
		
		@search.find_by_term(term, max_results)
	else
		@search.find_random(max_results)
	end

	@search.select_random_movie

	erb(:movie_results)
end