class Student < ActiveRecord::Base
  has_many :tweets
  has_many :statistics
end
