class Api::Users::SessionsController < ActionController::Base
  def create
    user = User.find_for_database_authentication(email: user_params[:email])
    if user.present? && user.valid_password?(user_params[:password])
      sign_in(user)
      render status: :ok, json: user.reload.to_json
    else
      render status: :unauthorized, json: t('devise.sessions.invalid').to_json
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def assign_user
    token = request.env['HTTP_USER_TOKEN']
    User.find_by(auth_token: token) if token
  end

  def sign_in(user)
    user.current_sign_in_ip = request.remote_ip
    user.current_sign_in_at = Time.current
    user.assign_auth_token!
  end
end
