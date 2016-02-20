class AddReferencesToBarbecueItems < ActiveRecord::Migration
  def change
    add_reference :barbecue_items, :barbecue, index: true
    add_foreign_key :barbecue_items, :barbecues
    add_reference :barbecue_items, :item, index: true
    add_foreign_key :barbecue_items, :items
  end
end
