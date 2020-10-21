# frozen_string_literal: true

# ProjectsController comment
class ProjectsController < ApplicationController
  load_and_authorize_resource

  def new
    @project = Project.new
    respond_to do |format|
      format.js
    end
  end

  def create
    project = Project.new(project_params(:name))
    if project.save
      redirect_to root_url
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params(:name))
    redirect_to root_url
  end

  def destroy
    @project = Project.find(params[:id]).destroy
    redirect_to root_url
  end

  private

  def project_params(*args)
    params.require(:project).permit(*args)
  end
end
