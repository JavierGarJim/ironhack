class Entry < ActiveRecord::Base
  	belongs_to :project

	validates :hours, 
  		numericality: {only_integer: true}
  	validates :minutes, 
  		numericality: {only_integer: true}
  	validates :project_id, 
  		presence: true

  	validates_presence_of :hours, :minutes, :date
end
