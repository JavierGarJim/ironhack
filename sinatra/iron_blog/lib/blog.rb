
require 'colorize'

class Blog
    attr_reader :posts
    
    def initialize
    	@posts = []
    end

    def add_post(post)
		@posts.push(post)
		@posts
    end

    def latest_posts
    	sorted_posts = @posts.sort do |p1, p2|
    		p2.date <=> p1.date
    	end
    end

    def publish_front_page
    	@posts.sort! {| x, y | y.date <=> x.date}

    	user_input = ""
    	page = 1
    	post_per_post = 3

    	while user_input != "exit"
    		system "clear"
    		
    		remaining_posts = post_per_post
			i = 0

    		while (i < post_per_post) do
    			post_index = i + (page - 1) * post_per_post

    			if (post_index >= @posts.length)
   					break
   				else
   					@posts[post_index].print_post
				end

   				i += 1
			end

			number_of_pages = (@posts.length.to_f / post_per_post).ceil

			puts "\n\n\n"

			(1..number_of_pages).each {
				|i|

				if i == page
					print "#{i} ".colorize(:blue)
				else
					print "#{i} "
				end
			}

			begin
				puts "\nPlease enter the page number or exit"

				user_input = gets.chomp

				if (user_input.to_i > 0 && user_input.to_i <= number_of_pages) || (user_input == "exit")
					page = user_input.to_i

					break
				else
					puts "Please select a valid option!"
				end
			end while true
    	end
    end
end