class TournamentsController < ApplicationController
  	def index
    	render(:index)
  	end

  	def show_tournaments
		tournaments = Tournament.all
		
		render json: tournaments
  	end

  	def new_tournament
		tournament = Tournament.create(tournament_params)
		
		unless tournament
			render json: {error: "tournament not created"},
			
			status: 404
			
			return
		end

		render json: tournament, status: 201
  	end

  	def delete_tournament
		tournament = Tournament.find_by(id: params[:id])

		tournament.delete

		render json: tournament
  	end


	private

	def tournament_params
		params.require(:tournament)
				.permit(:name)
	end
end
