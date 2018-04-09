class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.string :status, null: false, default: 'todo'
      t.datetime :status_changed
      t.date :due_date

      t.timestamps
    end
  end
end
