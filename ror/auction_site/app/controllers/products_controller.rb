class ProductsController < ApplicationController
	def show
		@product = Product.find(params[:id])
		@bids = @product.bids
		@reviews = @product.reviews
		@review = Review.new
	end

	def index
		if params[:user_id]
			@user = User.find(params[:user_id])
			@products = @user.products

			render 'user_index'
		else
			@products = Product.all
		end
	end

	def new
		if params[:user_id]
			@user = User.find(params[:user_id])
			@product = @user.products.new

			render 'user_new'
		else
			@product = Product.new
		end
	end

	def create
		if params[:user_id]
			@user = User.find(params[:user_id])

			@product = @user.products.new(product_params)

			if @product.save
				redirect_to action: 'index', controller: 'products', user_id: @user.id
			else
				render 'new'
			end
		else
			@user = User.find_by(email: params[:email])

			unless @user.nil?
				@product = @user.products.new(product_params)

				if @product.save
					redirect_to action: 'index', controller: 'products'
				else
					render 'new'
				end
			else
				render 'user_not_found'
			end
		end
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :deadline, :min_bid_amount)
	end
end
