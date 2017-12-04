class TasksController < ApplicationController

  def task_params 
    params.require(:task).permit(:title, :notes)
  end

  def show
    # UNUSED yet.
  end

  def index
    byebug
    @tasks = User.find(params[:user_id]).tasks
  end

  def new
    # UNUSED
  end

  def create
    byebug
    Task.create!(task_params)
    # UNUSED
  end
  
  def edit
    # UNUSED yet.
  end

  def update
    byebug
    # UNUSED yet.
  end
  
  def destroy
    # UNUSED yet.
  end

end
