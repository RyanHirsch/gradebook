class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  def index
    @profiles = Profile.all
  end

  def show
    @enrollments = @profile.enrollments.includes(:role, :section)

    #@active_enrollments = @enrollments.where("section.term.start_date <= ? AND section.term.end_date >= ?", Date.today, Date.today)
    #@future_enrollments = 
    #@past_enrollments = 
  end

  def edit
  end

  def update
    Rails.logger.debug { params[:profile] }
    if @profile.update(profile_params)
      flash[:notice] = "Profile has been updated."
      redirect_to @profile
    else
      # nothing yet
    end
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(
        :display_name,
        :first_name,
        :last_name,
        :dob,
        :streetaddress,
        :state,
        :zipcode,
        :city,
        :gender_id,
        :email
      )     
    end
end
