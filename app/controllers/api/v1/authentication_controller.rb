class Api::V1::AuthenticationController < ApplicationController
  class AuthenticationError < StandardError; end
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from AuthenticationError, with: :authentication_error

  def create
    raise AuthenticationError unless user.authenticate(params.require(:password))

    token = AuthenticationTokenService.call(user.id)
    render json: { token: token }, status: :created
  end

  private

  def parameter_missing(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end

  def authentication_error
    render status: :unauthorized
  end
end
