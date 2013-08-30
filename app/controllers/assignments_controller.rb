class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end
end
