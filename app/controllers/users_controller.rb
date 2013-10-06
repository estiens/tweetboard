class UsersController < ApplicationController

  def new
    @student=Student.new
  end

  def create
    @student=Student.new
  end


end
