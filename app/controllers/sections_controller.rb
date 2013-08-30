class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @roles = {
      "Teachers" => @section.enrollments.where(role: Role.find_by(name: "Teacher")),
      "Students" => @section.enrollments.where(role: Role.find_by(name: "Student"))
    }

    @assignments = {
      "Tests" => @section.assignments.where(assignment_type: AssignmentType.find_by(name: "Test"))
    }
  end

  def edit
  end


  private
    def set_section
      @section = Section.find(params[:id])
    end
end
