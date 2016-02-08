# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in (1..20)
	concert = Concert.create(artist: "Artist#{i}", venue: "Venue#{i}", city: "City#{i}", date: DateTime.now + (i * i * i).hour, price: i * 10, description: "Description#{i}")

	i.times do |j|
		comment = concert.comments.create(description: "Comment#{i}#{j}")
	end
end
