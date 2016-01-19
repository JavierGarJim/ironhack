
module Movements
	def Movements.straight_in_any_direction?(pieces, pos_x, pos_y, dst_x, dst_y, max_len)
		dx = dst_x - pos_x
		dy = dst_y - pos_y

		if dx == 0 && dy.abs <= max_len
			inc = 0

			if dst_y > pos_y
				inc = 1
			else
				inc = -1
			end

			while dst_y != pos_y do
				pos_y += inc
				
				if !pieces[pos_x][pos_y].nil?
					return false
				end
			end

			true
		elsif dy == 0 && dx.abs <= max_len
			inc = 0

			if dst_x > pos_x
				inc = 1
			else
				inc = -1
			end

			while dst_x != pos_x do
				pos_x += inc

				if !pieces[pos_x][pos_y].nil?
					return false
				end
			end

			true
		else
			false
		end
	end

	def Movements.diagonally_in_any_direction?(pieces, pos_x, pos_y, dst_x, dst_y, max_len)
		dx = dst_x - pos_x
		dy = dst_y - pos_y

		if dx.abs == dy.abs && dx.abs <= max_len
			inc_x = 0
			inc_y = 0
	
			if dst_x > pos_x
				inc_x = 1
			else
				inc_x = -1
			end

			if dst_y > pos_y
				inc_y = 1
			else
				inc_y = -1
			end

			while dst_x != pos_x do
				pos_x += inc_x
				pos_y += inc_y

				if !pieces[pos_x][pos_y].nil?
					return false
				end	
			end

			true
		else
			false
		end
	end

	def Movements.l_shaped_in_any_direction?(pieces, pos_x, pos_y, dst_x, dst_y)  
	    dx = (dst_x - pos_x).abs
	    dy = (dst_y - pos_y).abs

	    if (dx == 2 && dy == 1) || (dx == 1 && dy == 2)
			inc = 0

			if dst_y > pos_y
				inc = 1
			else
				inc = -1
			end

			while dst_y != pos_y do
				pos_y += inc
				
				if !pieces[pos_x][pos_y].nil?
					return false
				end
			end

			true
	    else
      		return false
	    end
	end

	def Movements.pawn_move?(pieces, pos_x, pos_y, dst_x, dst_y, color, first_move)
    	dx = dst_x - pos_x
    	dy = dst_y - pos_y

    	if dx == 0 && direction_correct?(dy, color) && length_correct?(dy, first_move)
  			if pieces[dst_x][dst_y].nil?
				true
			else
				false
			end
    	else
     		false
    	end
  	end

  	def direction_correct?(dy, color)
    	if color == "white" && dy > 0
      		true
    	elsif color == "black" && dy < 0
      		true
    	else
      		false
    	end
  	end

  	def length_correct?(dy, first_move)
    	if dy.abs == 1
      		true
    	elsif first_move && dy.abs == 2
      		true
    	else
      		false
    	end
	end
end