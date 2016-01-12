
class Post
    attr_reader :title, :date, :text

    def initialize(title, date, text)
  		@title = title
      	@date = date
      	@text = text
    end

	def print_post
		puts "Post title: #{@title}"
		puts "**************"
		puts "Post text: #{@text}"
		puts "----------------"
		puts ""
	end
end