
require "sinatra"
require "artii"


get "/ascii/?:font?/:text" do
	input_text = params[:text]
	
	if params[:font].nil?
		font_type = 'slant'
	else
		font_type = params[:font]
	end

	@asciifyed_text = Artii::Base.new :font => font_type
	@asciifyed_text = @asciifyed_text.asciify(input_text)

	erb(:ascii_art)
end