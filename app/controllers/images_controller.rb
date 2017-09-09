class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = current_user.images
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user
    @image.save
  end

  private
    def image_params
      params.require(:image).permit(:file)
    end
end
