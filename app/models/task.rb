class Task < ApplicationRecord
  has_many :task_categories
  has_many :categories, through: :task_categories

  has_many :subtasks, class_name: 'Task', foreign_key: :parent_id
  belongs_to :parent, inverse_of: :subtasks, optional: :true, class_name: 'Task'

  scope :parent_tasks, -> { where(parent_id: nil) }
  scope :text_contains, -> (text) { where("to_tsvector(title || ' ' || description) @@ to_tsquery(?)", text) }
end
