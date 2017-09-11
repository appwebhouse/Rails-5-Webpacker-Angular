module Api::Authorization extend ActiveSupport::Concern
  def current_user
    token = request.env['HTTP_USER_TOKEN']
    User.find_by(auth_token: token) if token
  end

  def ensure_and_set_current_user
    if user = current_user
      @user = user
    else
      render json: {}, status: :unauthorized
    end
  end
end
