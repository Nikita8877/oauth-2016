module SessionsHelper
  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def sign_in(user)
    session[:user_id] = user.id
  end
end