
require_relative("chessPiece.rb")


class ChessBoard
	def initialize(pieces)
		@pieces = pieces
  	end

  	def move?(start_x, start_y, dest_x, dest_y)
    	piece = @pieces[start_x][start_y]

    	# Bad move if the position doesn't change
    	if start_x == dest_x && start_y == dest_y
      		false
    	# Bad move if the coordinates are off the board
    	elsif start_x > 8 || start_y > 8 || dest_x > 8 || dest_y > 8 ||
          		start_x < 1 || start_y < 1 || dest_x < 1 || dest_y < 1
  			false
    	# Bad move if there is no piece in the start space
    	elsif piece == nil
      		false
    	# Good move if the piece says it can do the move
    	elsif piece.move?(@pieces, dest_x, dest_y)
      		true
    	# Bad move if the piece says it can't
    	else
      		false
    	end
  	end
end