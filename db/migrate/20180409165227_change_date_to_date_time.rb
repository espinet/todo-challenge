class ChangeDateToDateTime < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :due_date, :datetime
  end
end
