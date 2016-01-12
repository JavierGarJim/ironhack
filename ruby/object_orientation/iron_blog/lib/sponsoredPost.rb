
class SponsoredPost < Post
	def print_post
		puts "SPONSORED Post title: #{@title}"
		puts "****************************"
		puts "Post text: #{@text}"
		puts "----------------------------"
		puts ""
	end
end