class Sandwich < ActiveRecord::Base
	has_many :ingredients, through: :SandwichIngredient, foreign_key: :ingredient_id
end
