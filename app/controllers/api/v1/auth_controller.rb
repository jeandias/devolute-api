class Api::V1::AuthController < ApplicationController
  before_action :authorize_request, except: :sign_in

  def sign_in
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                     user: @user, success: "Welcome back, #{@user.email}" }, status: :ok
    else
      render json: { failure: 'Sign in failed! Email or password invalid!' }, status: :unauthorized
    end
  end

  private

  def sign_in_params
    params.permit(:email, :password)
  end
end
