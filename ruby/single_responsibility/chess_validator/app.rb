# app.rb

require_relative("chessPiece.rb")
require_relative("chessBoard.rb")

# --------------------------
# -------- Board -----------
# --------------------------

# Each smaller array is a column on the board
#                1    2    3    4    5    6    7    8
pieces = [ nil, [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ] ]
#           ^
#           |
# The first can be anything because we aren't going to use it


# --------------------------
# --------- King -----------
# --------------------------

black_king = King.new(5, 8, "black")
white_king = King.new(5, 1, "white")

puts "\nTesting the King"
puts "Good moves"
p white_king.move?(pieces, 6, 2)
p white_king.move?(pieces, 5, 2)
p white_king.move?(pieces, 4, 1)
puts "Bad moves"
p white_king.move?(pieces, 7, 2)
p white_king.move?(pieces, 1, 5)
p white_king.move?(pieces, 1, 1)

puts "\n------------------\n"


# --------------------------
# --------- Rook -----------
# --------------------------

black_rook_left = Rook.new(1, 8, "black")
black_rook_right = Rook.new(8, 8, "black")
white_rook_left = Rook.new(1, 1, "white")
white_rook_right = Rook.new(8, 1, "white")

puts "\nTesting the Rook"
puts "Good moves"
p white_rook_right.move?(pieces, 8, 5)
p white_rook_right.move?(pieces, 2, 1)
puts "Bad moves"
p white_rook_right.move?(pieces, 6, 3)
p white_rook_right.move?(pieces, 2, 3)

puts "\n------------------\n"


# --------------------------
# -------- Knight ----------
# --------------------------

black_knight_left = Knight.new(2, 8, "black")
black_knight_right = Knight.new(7, 8, "black")
white_knight_left = Knight.new(2, 1, "white")
white_knight_right = Knight.new(7, 1, "white")

puts "\nTesting the Knight"
puts "Good moves"
p white_knight_right.move?(pieces, 6, 3)
p white_knight_right.move?(pieces, 5, 2)
puts "Bad moves"
p white_knight_right.move?(pieces, 7, 4)
p white_knight_right.move?(pieces, 3, 5)
p white_knight_right.move?(pieces, 8, 4)

puts "\n------------------\n"

pieces[1][8] = black_rook_left
pieces[2][8] = black_knight_left
pieces[5][8] = black_king
pieces[7][8] = black_knight_right
pieces[8][8] = black_rook_right

pieces[1][1] = white_rook_left
pieces[2][1] = white_knight_left
pieces[5][1] = white_king
pieces[7][1] = white_knight_right
pieces[8][1] = white_rook_right

my_board = ChessBoard.new(pieces)

puts "Board class"
puts "Good moves"
p my_board.move?(7, 1,  6, 3)
p my_board.move?(5, 1,  4, 2)

puts "Bad moves"
p my_board.move?(5, 4,  1, 1)
p my_board.move?(1, 1,  50, 50)
p my_board.move?(8, 8,  8, 8)
p my_board.move?(8, 1,  7, 8)

