class Product < ActiveRecord::Base
	belongs_to :user
	has_many :bids, dependent: :destroy
	has_many :bidders, class_name: 'Bid', through: :bids, foreign_key: :user_id

	validates :title, 
		presence: true
	validates :description, 
		presence: true
	validates :deadline,
		presence: true
	validates :min_bid_amount, 
		presence: true
  	validates :user_id, 
  		presence: true
end
