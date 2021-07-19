class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      Membership.create(project: @project, user: current_user)
      redirect_to projects_path
    else
      render action: 'new'
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
