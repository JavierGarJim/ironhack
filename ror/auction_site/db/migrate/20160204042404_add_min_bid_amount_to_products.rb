class AddMinBidAmountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :min_bid_amount, :integer
  end
end
