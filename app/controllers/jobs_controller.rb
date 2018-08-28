class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    ## one idea:
    # company = Company.find(params[:company_id])
    # job = company.jobs.create(job_params)
    # binding.pry

    ## two idea:
    @job = Job.create(params[job_params])
    @company = @job.company
    redirect_to jobs_path

    ## return to this later
    # if @job.save
    #   flash[:success] = "You created #{@job.title} at #{@job.company.name}"
    #   redirect_to jobs_path
    # else
    #   render :new
    # end
  end

  def show
    @job = Job.find(params[:id])
    @comments = @job.comments
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

    flash[:success] = "Job was successfully deleted!"
    redirect_to jobs_path(job)
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
