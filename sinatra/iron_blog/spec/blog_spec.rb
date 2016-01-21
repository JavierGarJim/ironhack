
require_relative("../lib/post.rb")
require_relative("../lib/sponsoredPost.rb")
require_relative("../lib/blog.rb")


describe Blog do
	before :each do      
    @post1 = Post.new("Post1", Time.new, "TODO 1", "Technology", "Javi")
    @sponsoredPost2 = SponsoredPost.new("Post2", Time.new, "TODO 2", "Technology", "Javi")
    @post3 = Post.new("Post3", Time.new, "TODO 3", "Technology", "Javi")

		@blog = Blog.new
	end

  	describe "#add_post" do
    	it "adds a new post" do
    		expect(@blog.posts).to eq([])
      	expect(@blog.add_post(@post1)).to eq([@post1])
    		expect(@blog.add_post(@sponsoredPost2)).to eq([@post1, @sponsoredPost2])
      	expect(@blog.add_post(@post3)).to eq([@post1, @sponsoredPost2, @post3])
    	end
  	end

  	describe "#latest_posts" do
    	it "returns the posts sorted by date" do
    		@blog.add_post(@post1)
    		@blog.add_post(@sponsoredPost2)
    		@blog.add_post(@post3)

      	expect(@blog.latest_posts).to eq([@post3, @sponsoredPost2, @post1])
    	end
  	end  	
end