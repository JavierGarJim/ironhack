class LinksController < ApplicationController
	def index
		
	end

	def create
		valid_url = Link.get_valid_url(params[:link][:original])

    	@link = Link.where(original: valid_url)[0]

    	if @link.nil?
    		@link = Link.new(:original => valid_url)

			@link.save
    	end

		render "index"
  	end

	def short
		short = params[:shortlink]

		original = Link.get_original(short)

		redirect_to(original)
	end
end
