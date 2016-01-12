class Home
	attr_reader(:name, :city, :capacity, :price)

	def initialize(name, city, capacity, price)
		@name = name
		@city = city
		@capacity = capacity
		@price = price
	end
end


def get_homes(array)
	array.each {
		| home |
		puts "Name: #{home.name}\t\t|\tCity: #{home.city}\t\t|\t\tCapacity: #{home.capacity}\t\t|\t\tPrice: #{home.price}"
	}
	puts ""
end

homes = [
	Home.new("Nizar's place", "San Juan", 2, 42),
	Home.new("Fernando's place", "Seville", 5, 47),
  	Home.new("Josh's place", "Rome", 3, 41),
  	Home.new("Gonzalo's place", "Málaga", 2, 45),
  	Home.new("Ariel's place", "San Juan", 4, 49),
  	Home.new("Anais's place", "Miami", 5, 39),
  	Home.new("Michael's place", "Munich", 3, 55),
  	Home.new("Matt's place", "Granada", 2, 50),
  	Home.new("Julian's place", "New York", 1, 51),
  	Home.new("Emilio's place", "Munich", 6, 53),
]


puts "\nWelcome to TextBnB!!!\n\n"

get_homes(homes)

puts "-------------------------"
puts "                        "

prompt = "\nOptions:\n\tsort.name\n\tsort.city\n\tsort.capacity\n\tsort.price\n\tfilter.city\n\tprice.average\n\tprice.get\n\texit\n\n> "
print prompt

while user_input = gets.chomp # loop while getting user input
  	case user_input
  		when "sort.name"
			homes.sort! {| x, y | y.name <=> x.name}
			get_homes(homes)
  
  		when "sort.city"
			homes.sort! {| x, y | y.city <=> x.city}
			get_homes(homes)

    	when "sort.capacity"
			homes.sort! {| x, y | y.capacity <=> x.capacity}
			get_homes(homes)

    	when "sort.price"
			homes.sort! {| x, y | y.price <=> x.price}
			get_homes(homes)

		when "filter.city"
			print "\nSelect homes in the city:\n> "
			city = gets.chomp
			puts ""

			filtered_homes = homes.select {
				| home |
				home.city == city
			}

			get_homes(filtered_homes)

		when "price.average"
			puts "\nThe average price is " + (homes.reduce(0) {| sum, home | sum + home.price} / homes.length).to_s

		when "price.get"
			print "\nFind a home with the price:\n> "
			price = gets.chomp
			puts ""			

			found_home = homes.find {
				| home |
				home.price == price.to_i
			}
			
			get_homes([ found_home ])

		when "exit"
			break

  	else
  		
    	puts "Please select a valid option!"
  	end

	print prompt
end




