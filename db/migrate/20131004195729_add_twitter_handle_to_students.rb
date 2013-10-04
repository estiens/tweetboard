class AddTwitterHandleToStudents < ActiveRecord::Migration
    def self.up
      add_column :students, :twitter_handle, :string
    end
  
    def self.down
      remove_column :students, :twitter_handle
    end
end
