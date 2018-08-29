class DashboardController < ApplicationController
  def index
    @jobs = Job.group_by_interest
    @cityjobs = Job.group_by_city
  end
end
