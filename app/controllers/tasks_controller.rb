class TasksController < ApplicationController

  def task_params 
    params.require(:task).permit(:title, :notes)
  end

  def show
    @tasks = Task.all.order(:completed)
  end

  def index
    @tasks = User.find(params[:user_id]).tasks.order(:completed)
  end

  def create
    Task.create!(task_params)
    # UNUSED
  end
  
  def update
    # UNUSED yet.
  end
  

end
