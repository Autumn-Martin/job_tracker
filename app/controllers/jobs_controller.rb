class JobsController < ApplicationController
  def index
    @jobs = Job.all 
  end

  def new
    @job = Job.new()
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@job.company.name}"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    # @company = Company.find(params[:company_id])
    # @job = @company.jobs.find(params[:id])
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])


    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to jobs_path(@job)
    else
      render :edit
    end
  end


  def destroy
    job = Job.find(params[:id])
    job.destroy

    flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to jobs_path(job)
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
