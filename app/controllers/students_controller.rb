class StudentsController < ApplicationController
  def index
    @students = Student.page(params[:page])
  end

  def show
    @student = Student.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @students = Student.where("name LIKE ?", wildcard_search)
  end
end
