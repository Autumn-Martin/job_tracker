class DashboardController < ApplicationController
  def index
    @level_of_interest = Job.interest_level
  end
end
