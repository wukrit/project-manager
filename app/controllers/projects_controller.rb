class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save && @project.memberships.create(user: current_user, role: :admin)
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
