class Api::V1::JobsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs, status: 200
  end

  def create
    job = Job.new(job_params)
    if job.save
      render json: job, status: :created
    else
      render json: { error: job.errors.messages }, status: 422
    end
  end

  def destroy
    job = Job.find(params[:id])
    if job.destroy
      head :no_content
    else
      render json: { error: job.errors.messages }, status: 422
    end
  end

  def update
    job = Job.find(params[:id])
    if job.update(job_params)
      render json: job, status: 200
    else
      render json: { error: job.errors.messages }, status: 422
    end
  end

  private

  def job_params
    params.require(:job).permit(:company, :position, :date, :application_link)
  end
end
