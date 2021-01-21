class Api::V1::JobsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs, status: 200
  end
end
