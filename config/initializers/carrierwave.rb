require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

  # 本番環境用でS3に保存する時用
if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'freemarket-sample-51c'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket-sample-51c'
  end
end
