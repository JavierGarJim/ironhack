class PlayersController < ApplicationController
  	def get_players
		players = Player.all
		
		render json: players
  	end
end
