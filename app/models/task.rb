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
