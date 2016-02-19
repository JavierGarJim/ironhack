class BidsController < ApplicationController
	def new
		if params[:product_id]
			@product = Product.find(params[:product_id])
			@bid = @product.bids.new
		else
			@bid = Bid.new
		end
	end

	def create
		@product = Product.find(params[:product_id])

		@bid = @product.bids.new(bid_params)
		@bid.user = current_user

		if @bid.save
			redirect_to action: 'show', controller: 'products', id: @product.id
		else
			render 'new'
		end
	end

	private

	def bid_params
		params.require(:bid).permit(:amount)
	end
end
