class ProjectsController < ApplicationController
  def index
      @projects = current_user.projects.all
  end

  def show
    @project = Project.find params[:id]
  end

  def new
    @project = Project.new
  end

  def create
    if current_user.projects.create(project_params)
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    if @project.update_attributes(project_params)
      redirect_to :action => 'index'
    end
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end
end
