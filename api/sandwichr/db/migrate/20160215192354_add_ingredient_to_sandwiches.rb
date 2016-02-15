class AddIngredientToSandwiches < ActiveRecord::Migration
  def change
    add_reference :sandwiches, :ingredient, index: true, foreign_key: true
  end
end
