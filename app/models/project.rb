# frozen_string_literal: true

# This keep projects
class Project < ApplicationRecord
  has_many :tasks, dependent: :delete_all

  validates :name, presence: true

  scope :default_ordered, -> { order('projects.created_at').includes(:tasks).order('tasks.position') }
end
