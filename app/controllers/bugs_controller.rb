class BugsController < ApplicationController
  def index
    if current_user.user_type == "manager"
      projects = current_user.projects
      @bugs = Bug.where(:user_id=>current_user.id).or(Bug.where(:project_id => projects.ids))
    elsif current_user.user_type == "developer"
      @bugs = Bug.where(:user_id=>current_user.id).or(Bug.where(:developer_id=>current_user.id))
    end
  end

  def show
    @bug = Bug.find params[:id]
  end

  def new
    @bug = Bug.new
    @developers = User.where(:user_type=>"developer")
    @projects = Project.all
  end

  def create
    @bug = current_user.bugs.new(bug_params)
    if @bug.save
      redirect_to :action => 'show', :id => @bug.id
    else
      render :action => 'new'
    end
  end

  def destroy
    @bug = Bug.find params[:id]
    @bug.destroy
  end

  def edit
    @bug = Bug.find params[:id]
  end

  def update
    @bug = Bug.find params[:id]
    if @bug.update_attributes(bug_params)
      redirect_to :action => 'show', :id => @bug.id
    end
  end

  private
  def bug_params
    params.require(:bug).permit(
      :title,
      :deadline,
      :bug_type,
      :status,
      :developer_id,
      :project_id,
      :attachment
    )
  end
end
