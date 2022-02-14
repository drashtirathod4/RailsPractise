class ResetAllStudentsCacheCounters < ActiveRecord::Migration[7.0]
  def up 
    Student.all.each do |student|
      Student.reset_counters(student.id, :tasks)
    end
  end
  def down 
  end
end
