class CommentsController < ApplicationController
	def create
		@concert = Concert.find(params[:concert_id])

		@comment = @concert.comments.new(comment_params)

		if @comment.save
			redirect_to action: 'show', controller: 'concerts', id: @concert.id
		else
			render 'new'
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:description)
	end
end
