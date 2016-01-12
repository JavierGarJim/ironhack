#                 0         1        2           3           4
shoe_brands = [ "Nike", "Reebok", "Puma", "Steve Madden", "Uggs" ]

# shoe_brands.each_with_index do | brand, i |
#   puts "This brand is my No. #{i + 1} favorite: #{brand}"
# end

# upper_shoe_brands = shoe_brands.map do |brand|
# 	brand.upcase
# end

upper_shoe_brands = shoe_brands.map { 
	|brand| 
	brand.upcase 
}

puts shoe_brands

puts upper_shoe_brands