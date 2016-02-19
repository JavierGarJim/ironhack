class ReviewsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])

		@review = @product.reviews.new(review_params)
		@review.user = current_user

		@review.save

		redirect_to action: 'show', controller: 'products', id: @product.id
	end

	private

	def review_params
		params.require(:review).permit(:description)
	end
end
