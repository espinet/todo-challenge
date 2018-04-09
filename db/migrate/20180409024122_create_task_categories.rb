class CreateTaskCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :task_categories do |t|
      t.integer :task_id
      t.integer :category_id

      t.timestamps
    end
  end
end
