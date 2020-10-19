# frozen_string_literal: true

# Global application methods
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
