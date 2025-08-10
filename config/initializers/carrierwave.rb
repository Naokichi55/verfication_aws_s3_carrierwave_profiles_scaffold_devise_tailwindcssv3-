#AmazonS3への保存
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

#保存先の分岐
CarrierWave.configure do |config|
 if Rails.env.production?
	config.storage = :fog
	# config.fog.provider = 'fog/aws'
	config.fog_directory = ENV['PROFILE_AWS_BUCKET']
	config.fog_credentials = {
		provider: 'AWS',
		aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
		aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
		region: ENV['AWS_RESION'],
	}
else
  config.storage :file #開発環境はpublic/uplodersに保存する
	config.enable.processing = false if Rails.env.test?
 end
end