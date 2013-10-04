class AddStudentIdToStatistics < ActiveRecord::Migration
  def self.up
    add_column :statistics, :student_id, :integer
  end
  
  def self.down
    remove_column :statistics, :student_id
  end
end
