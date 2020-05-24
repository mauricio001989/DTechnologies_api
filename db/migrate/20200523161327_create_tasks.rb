class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.date :deadline, null: false
      t.string :description, null: false
      t.integer :state, default: 0
      t.integer :priority, default: 3
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
