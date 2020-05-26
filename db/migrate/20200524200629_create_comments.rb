class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :task, null: false, foreign_key: true
      t.string :comment, null: false
      t.string :url
      t.string :document

      t.timestamps
    end
  end
end
