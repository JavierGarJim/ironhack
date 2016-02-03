class EntriesController < ApplicationController
	def update
		@project = Project.find(params[:project_id])
		@entry = @project.entries.find(params[:id])
		
		if @entry.update_attributes(entry_params)
			flash[:notice] = 'Entry updated successfully'
			redirect_to action: 'index'
		else
			flash.now[:errors] = @entry.errors.full_messages
			render 'edit'
		end
	end

	def edit
		@project = Project.find(params[:project_id])
		@entry = @project.entries.find(params[:project_id])
	end

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
		@project = Project.find(params[:project_id])
		@entry = @project.entries.new
	end

	def create
		@project = Project.find(params[:project_id])
		@entry = @project.entries.new(entry_params)

		if @entry.save
			redirect_to action: 'index', controller: 'entries', project_id: @project.id
		else
			render 'new'
		end
	end

	private

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end
end
