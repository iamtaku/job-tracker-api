class ApplicationController < ActionController::API
  rescue_from JWT::VerificationError, JWT::DecodeError, ActiveRecord::RecordNotFound, with: :authentication_error
  include ActionController::HttpAuthentication::Token

  private

  def user
    @user ||= User.find_by(username: params.require(:username))
  end

  def authenticate_user
    # Authorization: Bearer <token>
    token, _options = token_and_options(request)
    user_id = AuthenticationTokenService.decode(token)

    @user = User.find(user_id)
  end

  def authentication_error
    render status: :unauthorized
  end
end
