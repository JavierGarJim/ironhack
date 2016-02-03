class ProjectsController < ApplicationController
  def index
  	@projects = Project.last_created_projects(10)

  	if @projects.empty?
  		render 'no_projects'
  	else
  		render 'index'
  	end
  end
end
