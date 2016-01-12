
require_relative("lib/post.rb")
require_relative("lib/sponsoredPost.rb")
require_relative("lib/blog.rb")

blog = Blog.new
blog.add_post Post.new("Ironhack Prework", "Week0", "Starting from zero")
blog.add_post Post.new("Welcome to Ironhack!", "Week1", "I'm so excited!!")
blog.add_post Post.new("Week2", "Week2", "TODO")
blog.add_post SponsoredPost.new("Improving skills at Ironhack!", "Week3", "This is getting interesting :)")
blog.add_post Post.new("Week4", "Week4", "TODO")
blog.add_post Post.new("Week5", "Week5", "TODO")
blog.add_post Post.new("Week6", "Week6", "TODO")
blog.add_post SponsoredPost.new("Week7", "Week7", "TODO")
blog.add_post Post.new("Final project", "Week8", "I did it! I'm officially an Ironhacker!")
blog.add_post Post.new("Career Week", "Week9", "I want an exciting job!")

blog.publish_front_page