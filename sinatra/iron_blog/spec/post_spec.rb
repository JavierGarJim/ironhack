
require_relative("../lib/post.rb")


describe Post do
    before :each do
        @title = "New Post"
        @date = Time.new
        @text = "TODO"
        @category = "Technology"
        @author = "Javi"

        @post = Post.new(@title, @date, @text, @category, @author)
    end

  	describe "#initialize" do
    	it "initializes a new post" do


    		expect(@post.title).to eq(@title)
    		expect(@post.date).to eq(@date)
    		expect(@post.text).to eq(@text)
            expect(@post.category).to eq(@category)
            expect(@post.author).to eq(@author)
    	end
  	end
end