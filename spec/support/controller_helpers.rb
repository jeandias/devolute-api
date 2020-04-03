module ControllerHelpers
  def sign_in(user)
    user = User.where(:login => user.to_s).first if user.is_a?(Symbol)
    token = JsonWebToken.encode(user_id: user.id)
    request.headers['Authorization'] =token
  end
end
