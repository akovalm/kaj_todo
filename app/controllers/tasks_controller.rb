# frozen_string_literal: true

# TasksController comment
class TasksController < ApplicationController
  load_and_authorize_resource

  def new
    @task = Task.new
    respond_to do |format|
      format.js
    end
  end

  def create
    task = Task.new(task_params)
    if task.save
      redirect_to root_url
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @task = Task.find(params[:id])
    puts "task: #{@task}, task_params: #{task_params}"
    @task.update(task_params)
    if params[:commit].nil? # xhr
      render json: { name: @task.name, status: Task::STATUSES[@task.status] }, status: :ok
    else
      redirect_to root_url
    end
  end

  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to root_url
  end

  private

  def task_params
    params.require(:task).permit(:id, :name, :status, :project_id, :deadline, :position)
  end
end
