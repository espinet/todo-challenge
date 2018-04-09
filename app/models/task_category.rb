class TaskCategory < ApplicationRecord
  belongs_to :task, dependent: :destroy
  belongs_to :category, dependent: :destroy
end
