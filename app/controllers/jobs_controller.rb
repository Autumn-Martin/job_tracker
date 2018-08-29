class JobsController < ApplicationController

  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    elsif params[:sort]
      @jobs = Job.sort_jobs(params[:sort])
    elsif params[:location]
      @jobs = Job.group_jobs_by_city(params[:location])
    else
      @jobs = Job.all
    end
  end

  def new
    @job = Job.new()
  end

  def create
    @job = Job.create(job_params)
    @company = @job.company
    redirect_to company_jobs_path(@company)
  end

  def show
    @job = Job.find(params[:id])
    @comments = @job.comments
    @comment = Comment.new()
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
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
    job = Job.find(params[:id])
    company = job.company
    job.destroy

    flash[:success] = "Job was successfully deleted!"
    redirect_to company_jobs_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end
end
