module ApiHelpers
  def api_sign_in(user)
    user.assign_auth_token!
    request.headers.merge!('USER_TOKEN' => user.auth_token)
  end
end
