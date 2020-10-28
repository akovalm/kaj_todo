# frozen_string_literal: true

# This keep project tasks
class Task < ApplicationRecord
  belongs_to :project

  NORMAL = 1
  ACTIVE = 2
  COMPLETED = 3

  STATUSES = {
    NORMAL => 'normal',
    ACTIVE => 'active',
    COMPLETED => 'completed'
  }.freeze

  validates :name, presence: true
  validates_inclusion_of :status, in: STATUSES.keys,
                                  message: "{{value}} must be in: #{STATUSES.values.join ','}"

  # get all statuses, not repeating, alphabetically ordered
  scope :all_statuses_not_repeat_sorted, -> {
    select(:status)
      .distinct
      .pluck('status')
      .map{ |k| STATUSES[k] }
      .sort
  }

  # get the tasks for all projects having the name beginning with letter
  scope :tasks_begin_with, ->(letter = 'N') {
    select('tasks.name')
      .where('tasks.name like :task_name', task_name: "#{letter}%")
  }

  # get the list of tasks with duplicate names. order alphabetically
  scope :tasks_duplicated_names, -> {
    select('name')
      .group('name')
      .order('name')
      .having('count(name) > 1')
  }

  # get the list of tasks having several matches of both name and status.
  # order by matches count
  scope :tasks_matches_name_status, ->(project_name = 'Garage') {
    left_joins(:project)
      .where('projects.name = :project_name', project_name: "#{project_name}")
      .group('tasks.name', 'tasks.status')
      .order('count(tasks.name)')
      .having('count(tasks.name) > 1')
      .count()
  }

  # helper method for view
  def status_name
    STATUSES[status]
  end

  def self.get_by_status(status)
    all.select do |task|
      task.status == status
    end
  end
end
