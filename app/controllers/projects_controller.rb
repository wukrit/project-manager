class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def show
    @project = current_user.projects.find(params[:id])
    @membership = current_user.memberships.find_by(project: @project)
  end

  def create
    @project = Project.new(project_params)

    if @project.save && @project.memberships.create(user: current_user, role: :admin)
      redirect_to projects_path
    else
      render action: 'new'
    end
  end

  def destroy
    if current_user.memberships.find_by(project_id: params[:id], role: :admin)
      current_user.projects.find(params[:id]).destroy
      redirect_to projects_path
    else
      render action 'show'
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
