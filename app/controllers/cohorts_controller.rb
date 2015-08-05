class CohortsController < ApplicationController

  def index
    current_cohort_id = current_user.cohort_id
    @user_cohort = User.where(cohort_id: current_cohort_id)
  end

end
