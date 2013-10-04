class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username
      t.string :tagline
      t.string :location
      t.timestamps
    end
  end
end
