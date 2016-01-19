
require_relative("movements.rb")


class ChessPiece
	include Movements

	attr_reader :pos_x, :pos_y

	def initialize(init_x, init_y, color)
		@pos_x = init_x
		@pos_y = init_y
		@color = color
		@first_move = true
	end

	def move?(pieces, dst_x, dst_y)

	end
end


class King < ChessPiece
	def move?(pieces, dst_x, dst_y)
		Movements.straight_in_any_direction?(pieces, @pos_x, @pos_y, dst_x, dst_y, 1) ||
		Movements.diagonally_in_any_direction?(pieces, @pos_x, @pos_y, dst_x, dst_y, 1)
	end
end


class Knight < ChessPiece
	def move?(pieces, dst_x, dst_y)
		Movements.l_shaped_in_any_direction?(pieces, @pos_x, @pos_y, dst_x, dst_y)
	end
end


class Pawn < ChessPiece
	def move?(pieces, dst_x, dst_y)
		Movements.pawn_move?(pieces, @pos_x, @pos_y, dst_x, dst_y, @color, @first_move)
	end
end


class Queen < ChessPiece
	def move?(pieces, dst_x, dst_y)
		Movements.straight_in_any_direction?(pieces, @pos_x, @pos_y, dst_x, dst_y, 8) ||
		Movements.diagonally_in_any_direction?(pieces, @pos_x, @pos_y, dst_x, dst_y, 8)
	end
end


class Rook < ChessPiece
	def move?(pieces, dst_x, dst_y)
		Movements.straight_in_any_direction?(pieces, @pos_x, @pos_y, dst_x, dst_y, 8)
	end
end


class Bishop < ChessPiece
	def move?(pieces, dst_x, dst_y)
		Movements.diagonally_in_any_direction?(pieces, @pos_x, @pos_y, dst_x, dst_y, 8)
	end
end