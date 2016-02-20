class CreateBarbecueItems < ActiveRecord::Migration
  def change
    create_table :barbecue_items do |t|

      t.timestamps null: false
    end
  end
end
