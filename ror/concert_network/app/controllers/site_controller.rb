class SiteController < ApplicationController
	def home
		@today_concerts = Concert.today_concerts
		@month_concerts = Concert.month_concerts
	end
end
