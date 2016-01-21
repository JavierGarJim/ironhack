
require 'colorize'


class Post
    attr_reader :title, :date, :text

    def initialize(title, date, text)
  		@title = title
      	@date = date
      	@text = text
    end

	def print_post
		puts "#{@title}".colorize(:red)
		puts "**************"
		puts "#{@text}".colorize(:white)
		puts "----------------"
		puts ""
	end
end