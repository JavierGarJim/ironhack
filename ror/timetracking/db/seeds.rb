# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
	p = Project.create(name: "P#{i}", description: "Project #{i}")

	if i.odd?
		p.entries.create(hours: 10 * i, minutes: 0, comments: "Entry #{i}", date: Time.current)
	else
		p.entries.create(hours: 20 * i, minutes: 0, comments: "Entry #{i}", date: Time.current)
	end
end