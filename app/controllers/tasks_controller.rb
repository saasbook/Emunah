class TasksController < ApplicationController

  def task_params 
    params.require(:task).permit(:title, :notes)
  end

  def show
    # UNUSED yet.
  end

  def index
    @tasks = User.find(params[:user_id]).tasks
  end

  def create
    Task.create!(task_params)
    # UNUSED
  end
  
  def update
    # UNUSED yet.
  end
  

end
