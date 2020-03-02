class TasksController < ApplicationController
  def index
    # @active_tasks = Task.get_by_status(Task::ACTIVE)
    # @completed_tasks = Task.get_by_status(Task::COMPLETED)
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.js
    end
  end

  def create
    task = Task.new(task_params(:name, :status, :project_id))
    if task.save
      redirect_to root_url
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def show
    # @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params(:name, :status, :project_id))
    redirect_to root_url
  end

  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to root_url
  end

  private
  def task_params(*args)
    params.require(:task).permit(*args)
  end
end
