class AddProductRefToBids < ActiveRecord::Migration
  def change
    add_reference :bids, :product, index: true, foreign_key: true
  end
end
