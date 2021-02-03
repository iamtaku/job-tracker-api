require 'pry-byebug'

class Api::V1::JobsController < ApplicationController
  include ActionController::HttpAuthentication::Token
  before_action :authenticate_user
  # rescue_from JWT::VerificationError, JWT::DecodeError, ActiveRecord::RecordNotFound, with: :authentication_error

  def index
    @jobs = @user.jobs.all
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
      render json: JobSerializer.new(job).serializable_hash.to_json, status: 200
    else
      render json: { error: job.errors.messages }, status: 422
    end
  end

  private

  def authenticate_user
    # Authorization: Bearer <token>
    # p request
    token, _options = token_and_options(request)
    user_id = AuthenticationTokenService.decode(token)
    # rescue JWT::VerificationError, JWT::DecodeError
    # render json: status: :unauthorized
    @user = User.find(user_id)
    # rescue ActiveRecord::RecordNotFound
    # render status: :unauthorized

  end

  def authentication_error
    render status: :unauthorized
  end

  def job_params
    params.require(:job).permit(:company, :position, :date, :application_link, :status, :user_id)
  end

  def options
    @options ||= { include: %i[steps] }
  end
end
