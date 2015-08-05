class CohortsController < ApplicationController

  def index
    current_cohort = current_user.cohort
    @user_cohort = User.where(cohort: current_cohort)
  end

end
