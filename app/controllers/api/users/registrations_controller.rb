class Api::Users::RegistrationsController < ActionController::Base
  def create
    user = User.create(user_params)

    if user.save
      render json: user.reload.to_json
    else
      render status: :unprocessable_entity, json: user.errors.full_messages.to_json
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
