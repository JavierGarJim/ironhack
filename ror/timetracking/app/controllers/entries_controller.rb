class EntriesController < ApplicationController
	def index
	  	@project = Project.find_by(id: params[:project_id])

	  	if @project.nil?
	  		render 'share/not_found'
	  	else
	  		@entries = @project.entries

	  		render 'index'
	  	end
	end

	def new
		@project = Project.find params[:project_id]
		@entry = @project.entries.new
	end

	def create

	end
end
