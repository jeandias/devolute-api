class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = JsonWebToken.encode(user_id: @user.id)

      render json: { user: @user, token: token }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
