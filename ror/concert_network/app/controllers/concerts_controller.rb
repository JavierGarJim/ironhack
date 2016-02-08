class ConcertsController < ApplicationController
	def index
		@concerts = Concert.concerts
	end

	def show
		@concert = Concert.find_by(id: params[:id])
		@comments = @concert.comments.all
		@comment = @concert.comments.new
	end

	def search_for_price
		@price = params[:price]

		@price_concerts = Concert.price_concerts(@price)

		render 'search'
	end

	def popular
		@popular_concerts = Concert.popular_concerts

		render 'popular'
	end
end
