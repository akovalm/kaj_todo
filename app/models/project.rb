# frozen_string_literal: true

# This keep projects
class Project < ApplicationRecord
  has_many :tasks, dependent: :delete_all

  validates :name, presence: true

  # default scope
  scope :default, -> {
    order('projects.created_at')
      .includes(:tasks)
      .order('tasks.position')
  }

  # get the count of all tasks in each project, order by tasks count desc
  scope :tasks_count_order_tasks_count, -> {
    left_joins(:tasks)
      .select('projects.name')
      .group('projects.name')
      .order('count(tasks.id) desc')
      .count('tasks.id')
  }

  # get the count of all tasks in each project, order by projects names
  scope :tasks_count_order_projects_names, -> {
    left_joins(:tasks)
      .select('projects.name')
      .group('projects.name')
      .order('projects.name')
      .count('tasks.id')
  }

  # get the list of all projects containing the letter in the middle of the name
  scope :projects_contain_middle, ->(letter = 'a') {
    joins('full outer join tasks on tasks.project_id = projects.id')
      .select('projects.name')
      .where('projects.name like :project_name', project_name: "%#{letter}%")
      .group('projects.name')
      .count('tasks.id')
  }

  # get the list of project names having more than 10 tasks in status 'completed'.
  # order by project_id
  scope :project_names_more_10_tasks, -> {
    left_joins(:tasks)
      .select('projects.id, projects.name')
      .where('tasks.status = :completed', completed: Task::COMPLETED)
      .group('projects.id' ,'projects.name')
      .having('count(tasks.status) > 5')
      .order('projects.id')
      .pluck('name')
  }
end
