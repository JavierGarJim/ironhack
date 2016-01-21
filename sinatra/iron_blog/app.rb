
require 'time'
require_relative("lib/post.rb")
require_relative("lib/sponsoredPost.rb")
require_relative("lib/blog.rb")

blog = Blog.new
blog.add_post Post.new("Ironhack Prework", Time.new(2016, 1, 1), "Starting from zero")
blog.add_post Post.new("Welcome to Ironhack!", Time.new(2016, 1, 8), "I'm so excited!!")
blog.add_post Post.new("Week2", Time.new(2016, 1, 17), "To be written...")
blog.add_post SponsoredPost.new("Improving skills at Ironhack!", Time.new(2016, 1, 25), "This is getting interesting :)")
blog.add_post Post.new("Week4", Time.new(2016, 2, 1), "To be written...")
blog.add_post SponsoredPost.new("Week5", Time.new(2016, 2, 8), "To be written...")
blog.add_post Post.new("Week6", Time.new(2016, 2, 17), "To be written...")
blog.add_post Post.new("Week7", Time.new(2016, 2, 25), "To be written...")
blog.add_post SponsoredPost.new("Final project", Time.new(2016, 3, 1), "I did it! I'm officially an Ironhacker!")
blog.add_post Post.new("Career Week", Time.new(2016, 3, 8), "I want an exciting job!")

blog.publish_front_page