class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @section = Section.new(course_id: params[:course_id], term_id: params[:term_id])
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      flash[:notice] = "Section has been created."
      redirect_to @section
    else
      flash[:alert] = "Section has not been created"
      render :action => "new"  
    end
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

  def update
    if @section.update(section_params)
      flash[:notice] = "Section has been updated."
      redirect_to @section
    else
      # nothing yet
    end
  end

  private
    def set_section
      @section = Section.find(params[:id])
    end

    def section_params
      params.require(:section).permit(
        :name,
        :course_id,
        :term_id
      )     
    end
end
