class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def initialize(*)
    super
    self.fog_directory = ENV['AWS_BUCKET']
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    %r{\Aimage\/.*\Z}
  end
end