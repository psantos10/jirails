# app/controllers/projects_controller.rb
class ProjectsController < ApplicationController
  before_action :require_admin

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def settings
    @project = Project.find(params[:project_id])
  end

  def add_user
    @project = Project.find(params[:project_id])
  end

  def save_user
    project = Project.find(params[:project_id])
    user = User.find(params[:user_id])

    project.add_user(user)

    redirect_to project
  end

  def members
    @project = Project.find(params[:project_id])
  end


  private
    def project_params
      params.require(:project).permit(:name, :description, :is_private)
    end

end
