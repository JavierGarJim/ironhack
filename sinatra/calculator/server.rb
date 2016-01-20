
require "sinatra"
require "sinatra/reloader" if development?
require "pry"
require_relative("lib/calculator.rb")


get "/calculator/?:first_number?" do
	# unless params[:first_number].nil?
		@first_number = params[:first_number]
	# end

	erb(:operation)
end

post "/do_operation" do
	# add numbers here
  	first = params[:first_number].to_f
  	second = params[:second_number].to_f
  	operation = params[:operation].to_sym
  	operator = Calculator.operators[operation]
  	result = first.method(operator).(second)
  	result_str = "#{first}#{operator}#{second}=#{result}"
	
  	# escaped_result_str = URI.escape(result_str, "/+-*=")
	
  	redirect to("/calculation_done/#{first}/#{operation}/#{second}/#{result}")
end

get "/calculation_done/:first_number/:operation/:second_number/:result" do
	@first = params[:first_number].to_f
  	@second = params[:second_number].to_f
  	@operation = params[:operation].to_sym
	operator = Calculator.operators[@operation]
	@result = params[:result].to_f

  	@result_str = "#{@first}#{operator}#{@second}=#{@result}"

	erb(:result)
end

post "/save_result/:result" do
  	File.open('public/results.txt', 'a') do |f|
    	f.puts params[:save]
  	end

  	redirect to("/calculator/#{params[:result]}")
end
