class AddTasksCountToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :tasks_count, :integer
  end
end
