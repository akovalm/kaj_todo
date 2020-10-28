# frozen_string_literal: true

# MainController comment
class MainController < ApplicationController
  def index
    @projects = Project.default
  end
end
