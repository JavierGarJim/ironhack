class User < ActiveRecord::Base
	has_many :products, dependent: :destroy
	has_many :bids, dependent: :destroy
	has_many :bidded_products, class_name: 'Product', through: :bids, foreign_key: :product_id

	validates :name, 
		presence: true,
		uniqueness: true
	validates :email, 
		presence: true,
		uniqueness: true
end
