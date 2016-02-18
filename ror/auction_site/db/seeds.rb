# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in (1..5)
	user = User.create(name: "User#{i}", email: "#{i}@user.com", password: "pass#{i}#{i}#{i}#{i}", password_confirmation: "pass#{i}#{i}#{i}#{i}")
	
	i.times do |j|
		product = user.products.create(title: "P#{i}#{j}", description: "Product#{i}#{j}", deadline: DateTime.current, min_bid_amount: i * j)

		j.times do |k|
			bid = product.bids.create(amount: i * j * k, user_id: user.id)
		end
	end
end