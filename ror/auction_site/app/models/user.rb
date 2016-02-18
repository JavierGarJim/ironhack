class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :products, dependent: :destroy
	has_many :bids, dependent: :destroy
	has_many :bidded_products, class_name: 'Product', through: :bids, foreign_key: :product_id
	has_many :reviews
	
	validates :name, 
		presence: true,
		uniqueness: true
	validates :email, 
		presence: true,
		uniqueness: true
end
