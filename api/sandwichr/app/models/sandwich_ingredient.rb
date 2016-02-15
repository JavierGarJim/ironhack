class SandwichIngredient < ActiveRecord::Base
	has_many :ingredients
	belongs_to :sandwich
end
