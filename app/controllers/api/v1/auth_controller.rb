class Api::V1::AuthController < ApplicationController
  skip_before_action :require_login, only: [:sign_in, :auto_login]

  def sign_in
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)

      render json: { user: user, jwt: token, success: "Welcome back, #{user.email}" }
    else
      render json: { failure: 'Sign in failed! Email or password invalid!' }
    end
  end
end
