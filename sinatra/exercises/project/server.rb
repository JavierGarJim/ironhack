
require "sinatra"


get "/" do
	"My first Sinatra app!"
end

get "/about" do
	"Mi name is Javi"
end

get "/hi" do
	@greeting = "Hello World!"

	erb(:hi)
end

get "/time/:shift/:offset_parameter/:offset_value" do	
	diff = 0

	if params[:shift] == "in"
		diff = 1
	elsif params[:shift] == "ago"
		diff = -1
	end

	if params[:offset_parameter] == "hours"
		diff *= params[:offset_value].to_i.hour.to_i
	elsif params[:offset_parameter] == "minutes"
		diff *= params[:offset_value].to_i.minute.to_i
	else
		diff = 0
	end
		
	@current_time = Time.now
	@shifted_time = @current_time + diff

	erb(:time)
end

get "/users/:username" do
	@username = params[:username]

	erb(:user_profile)
end