class Concert < ActiveRecord::Base
	has_many :comments
	
	validates :price, :numericality => { :greater_than_or_equal_to => 0 }
	validates_presence_of :artist, :venue, :city, :date, :price

	def self.concerts
		order('date ASC')
	end

	def self.today_concerts
		where(date: DateTime.now.beginning_of_day..DateTime.now.end_of_day).order('date ASC')
	end

	def self.month_concerts
		where(date: DateTime.now.beginning_of_month..DateTime.now.end_of_month).order('date ASC')
	end

	def self.price_concerts(price)
		where("price <= ?", price).order('date ASC')
	end

	def self.popular_concerts
		where('comments_count >= ?', 10).order('date ASC')
	end
end
