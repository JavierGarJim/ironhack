
require_relative('lib/room.rb')
require_relative('lib/game.rb')

room = Room.new("There is a light to the north", "N")
# room.display_description
room1 = Room.new("There is a mossy door to the East", "E")
# room1.display_description
room2 = Room.new("There is a barred door to the south", "S")
# room2.display_description
room3 = Room.new("There is a trap door to the west", "W")
# room3.display_description

my_game = Game.new

my_game.add_room(room)
my_game.add_room(room1)
my_game.add_room(room2)
my_game.add_room(room3)

my_game.play