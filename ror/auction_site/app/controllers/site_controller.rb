class SiteController < ApplicationController
	def home
		unless current_user.nil?
			redirect_to products_path
		end
	end
end
