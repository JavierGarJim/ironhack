
require 'colorize'


class Post
    attr_reader :title, :date, :text, :category, :author

    def initialize(title, date, text, category, author)
  		@title = title
    	@date = date
    	@text = text
    	@category = category
    	@author = author
    end

	def print_post
		puts "#{@title}".colorize(:red)
		puts "**************"
		puts "#{@text}".colorize(:white)
		puts "----------------"
		puts ""
	end
end