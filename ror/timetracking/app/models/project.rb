class Project < ActiveRecord::Base
	def self.clean_old
		where("created_at < ?", 1.week.ago).destroy_all
	end

	def self.last_created_projects(n)
		order(created_at: :desc).limit(n)
	end
end
