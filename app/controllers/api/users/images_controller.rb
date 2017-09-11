class Api::Users::ImagesController < ActionController::Base
  include Api::Authorization
  before_action :ensure_and_set_current_user

  def index
    images = @user.images.order(created_at: :desc)
    render json: images.to_json
  end

  def create
    image = Image.new(image_params)
    image.user = @user

    if image.save
      render json: image.to_json
    else
      render status: :unprocessable_entity, json: image.errors.full_messages.to_json
    end
  end

  private
    def image_params
      params.require(:image).permit(:file)
    end
end
