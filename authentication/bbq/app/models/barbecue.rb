class Barbecue < ActiveRecord::Base
	has_many :associations
	has_many :users, through: :associations, foreign_key: :user_id
	has_many :barbecue_items
	has_many :items, through: :barbecue_items, foreign_key: :item_id

  	validates :title, presence: true
  	validates :venue, presence: true
  	validates :date, presence: true
end
