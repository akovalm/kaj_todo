class AddPositionToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :position, :integer, default: 0
  end
end
