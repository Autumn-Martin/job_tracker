class JobsController < ApplicationController

  def index
    @jobs = Job.all
    @company = Company.find(params[:company_id])
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end





  def create
    ## one idea:
    # company = Company.find(params[:company_id])
    # job = company.jobs.create(job_params)

    ## two idea:
    @company = Company.find(params[:company_id])
    @job = Job.new(job_params)
    @company.jobs << @job
    redirect_to company_jobs_path(@company)

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
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.update(job_params)

    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_jobs_path(@company)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:company_id])
    job = Job.find(params[:id])
    job.destroy

    flash[:success] = "Job was successfully deleted!"
    redirect_to company_jobs_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
