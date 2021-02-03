class Api::V1::AuthenticationController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def create
    # params.require(:username)
    params.require(:password)
    user = User.find_by(username: params.require(:username))
    # p user
    token = AuthenticationTokenService.call(user.id)

    render json: { token: token } , status: :created
  end
  private
  def parameter_missing e
    render json: { error: e.message }, status: :unprocessable_entity
  end

end
