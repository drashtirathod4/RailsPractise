class AddStudentToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :student, foreign_key: true
  end
end
