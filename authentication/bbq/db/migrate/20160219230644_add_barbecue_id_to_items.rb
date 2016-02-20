class AddBarbecueIdToItems < ActiveRecord::Migration
  def change
    add_reference :items, :barbecue, index: true
    add_foreign_key :items, :barbecues
  end
end
