# Seed Barbecues

User.create(name: "Javi", email: "javi@me.com", password: "12345678", password_confirmation: "12345678")

10.times do |i|
  title = [ "#{Faker::Team.name} victory BBQ", "#{Faker::Name.name} Birthday BBQ" ].sample
  venue = [ Faker::Address.city, Faker::Company.name ].sample

  puts "Creating #{title} at #{venue}"
  barbecue = Barbecue.create(date: Faker::Date.forward(23), title: title, venue: venue)

  # i.times do |j|
  	item_name = "Item#{i}"

  	puts "Creating #{item_name}"
  	item = Item.create(name: item_name)

  	barbecue.items.push(item)
    # barbecue.items.push(item)
  # end
end
