
require "sinatra"
require "sinatra/reloader" if development?
require "pry"
require_relative("lib/post.rb")
require_relative("lib/sponsoredPost.rb")
require_relative("lib/blog.rb")


blog = Blog.new
blog.add_post(Post.new("Ironhack Prework", Time.new, "Starting from zero", "Technology", "Javier"))
blog.add_post(Post.new("Welcome to Ironhack!", Time.new, "I'm so excited!!", "Technology", "Javier"))
blog.add_post(Post.new("Week2", Time.new, "To be written...", "Technology", "Javier"))
blog.add_post(SponsoredPost.new("Improving skills at Ironhack!", Time.new, "This is getting interesting :)", "Technology", "Javier"))
blog.add_post(Post.new("Week4", Time.new, "To be written...", "Technology", "Javier"))
blog.add_post(SponsoredPost.new("Week5", Time.new, "To be written...", "Technology", "Javier"))
blog.add_post(Post.new("Week6", Time.new, "To be written...", "Technology", "Javier"))
blog.add_post(Post.new("Week7", Time.new, "To be written...", "Technology", "Javier"))
blog.add_post(SponsoredPost.new("Final project", Time.new, "I did it! I'm officially an Ironhacker!", "Technology", "Javier"))
blog.add_post(Post.new("Career Week", Time.new, "I want an exciting job!", "Technology", "Javier"))


get "/blog" do
	# @posts = blog.posts
	@posts = blog.latest_posts

	erb(:blog_index)
end

get "/blog/post/:post_index" do
	post_index = params[:post_index].to_i

	@post = blog.latest_posts[post_index]

	erb(:post_page)
end

get "/blog/new_post" do
	erb(:new_post)
end

post "/blog/create_post" do
  	title = params[:title]
  	text = params[:text]
  	author = params[:author]
  	category = params[:category]

  	if title == "" || author == ""
		redirect to("/new_post")
  	else
	  	new_post = Post.new(title, Time.new, text, category, author)

	  	blog.add_post(new_post)

		redirect to("/blog")
	end
end

