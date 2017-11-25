class TasksController < ApplicationController

  def show
    # UNUSED yet.
  end

  def index
    @tasks = User.find(params[:user_id]).tasks
  end

  def new
    # UNUSED
  end

  def create
    # UNUSED
  end
  
  def edit
    # UNUSED yet.
  end

  def update
    # UNUSED yet.
  end
  
  def destroy
    # UNUSED yet.
  end

end
