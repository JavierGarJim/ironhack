class Comment < ActiveRecord::Base
	belongs_to :concert, counter_cache: true, dependent: :destroy

	validates_presence_of :description
end
