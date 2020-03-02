class MainController < ApplicationController
  def index
    @projects = Project.all.order(name: 'asc')
  end
end
