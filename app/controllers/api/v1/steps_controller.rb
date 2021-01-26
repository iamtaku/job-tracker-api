class Api::V1::StepsController < ApplicationController
  def show
    step = Step.find(params[:id])
    render json: step
  end

  def create
    step = Step.new(step_params)
    job = Job.find(params[:job_id])
    step.job = job
    if step.save
      render json: StepSerializer.new(step).serializable_hash.to_json, status: 201
    else
      render json: { error: step.errors.messages }, status: 422
    end
  end

  def destroy
    step = Step.find(params[:id])
    if step.destroy
      head :no_content
    else
      render json: { error: step.errors.messages }, status: 422
    end
  end

  def update
    step = Step.find(params[:id])
    if step.update(step_params)
      render json: step, status: 200
    else
      render json: { error: step.errors.messages }, status: 422
    end
  end

  private

  def step_params
    params.require(:step).permit(:date, :status, :job_id)
  end

end
