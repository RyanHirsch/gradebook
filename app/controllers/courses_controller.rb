class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroys]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course has been created"
      redirect_to @course
    else
      flash[:alert] = "Course has not been created"
      render :action => "new"
    end
  end

  def show
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(
        :name,
        :code,
        :department_id
      )
    end
end
