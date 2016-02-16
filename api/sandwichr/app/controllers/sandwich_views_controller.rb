class SandwichViewsController < ApplicationController
	def index
		@sandwiches = Sandwich.all
	end

	def show
		@sandwich = Sandwich.find_by(id: params[:id])

		@more_ingredients = Ingredient.where.not(id: @sandwich.ingredients)
	end

	def home
		unless current_user.nil?
			redirect_to sandwiches_path
		end
	end
end
