module ControllerHelpers
  def sign_in(user)
    user = User.where(:login => user.to_s).first if user.is_a?(Symbol)
    request.session[:user_id] = user.id
  end
end
