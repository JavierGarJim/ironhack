class BarbecueItem < ActiveRecord::Base
	belongs_to :barbecue
	belongs_to :item

	validates_uniqueness_of :item_id, scope: [:barbecue_id]
end
