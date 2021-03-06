# frozen_string_literal: true

# CreateProjects comment
class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false, limit: 255

      t.timestamps
    end
  end
end
