class Contact < ActiveRecord::Base
	def self.alphabetical_order
		order(name: :desc)
	end
end
