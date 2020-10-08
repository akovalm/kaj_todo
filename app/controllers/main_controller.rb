# frozen_string_literal: true

# MainController comment
class MainController < ApplicationController
  def index
    @projects = Project.all.order(name: 'asc')
  end
end
