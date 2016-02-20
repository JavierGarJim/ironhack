class Item < ActiveRecord::Base
	has_many :barbecue_items
	has_many :barbecues, through: :barbecue_items, foreign_key: :barbecue_id
	validates :name, uniqueness: true
end
