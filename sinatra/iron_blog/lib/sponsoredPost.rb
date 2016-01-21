
require 'colorize'


class SponsoredPost < Post
	def print_post
		puts "#{@title}".colorize(:color => :red, :background => :white)
		puts "****************************"
		puts "#{@text}".colorize(:color => :black, :background => :white)
		puts "----------------------------"
		puts ""
	end
end