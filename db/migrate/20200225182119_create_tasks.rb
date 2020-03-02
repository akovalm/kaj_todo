class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false, limit: 255
      t.integer :status, null: false, limit: 1, default: 1 # 1 - normal, 2 - active, 3 - completed
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
