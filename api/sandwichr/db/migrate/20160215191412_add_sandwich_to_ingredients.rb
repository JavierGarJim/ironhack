class AddSandwichToIngredients < ActiveRecord::Migration
  def change
    add_reference :ingredients, :sandwich, index: true, foreign_key: true
  end
end
