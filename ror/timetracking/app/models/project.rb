class Project < ActiveRecord::Base
	has_many :entries

	def self.clean_old
		where("created_at < ?", 1.week.ago).destroy_all
	end

	def self.last_created_projects(n)
		order(created_at: :desc).limit(n)
	end

	def total_hours_in_month(month, year)
		sum = 0
		minutes = 0

		month = Date.new(year, month)

		entries
			.where(date: month.beginning_of_month..month.end_of_month)
			.each do |e|
				sum += e.hours
				minutes += e.minutes
		end

		hour_minutes = minutes / 60

		sum + hour_minutes
	end
end
