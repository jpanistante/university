class DepartmentsController < ApplicationController
  def index
    # Using the department model, load all departments from the db
    @departments = Department.all

    # This will end up in the index view (html.erb)
  end

  def show; end
end
