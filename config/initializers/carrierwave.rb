require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET'],
      region:                'eu-central-1',
      host:                  's3.example.com',
      endpoint:              'https://s3.eu-central-1.amazonaws.com'
    }
    config.fog_public     = false
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.days.to_i}" }
  end
end