class Api::V1::JobsController < ApplicationController
  def index
    @jobs = Job.all
    # render json: @jobs, status: 200
    render json: JobSerializer.new(@jobs).serializable_hash.to_json
  end

  def create
    job = Job.new(job_params)
    if job.save
      render json: JobSerializer.new(job).serializable_hash.to_json, status: 201
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

  def options
    @options ||= { include: %i[steps] }
  end
end
