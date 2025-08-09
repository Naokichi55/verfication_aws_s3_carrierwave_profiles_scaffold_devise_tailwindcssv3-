#AmazonS3への保存
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

#保存先の分岐
CarrierWave.configure do |config|
 if Rails.env.production?
	config.storage = :fog
	config.fog.provider = 'fog/aws'
	config.fog.credentials{
		#以下本番環境用にAWSの設定をしていないため一旦コメントアウト
		# provider: 'AWS'
		# aws_access_key_id: Rails.application.credentials.aws[:aws_access_key_id]
		# aws_secret_access_key: Rails.application.credentials.aws[:aws_secret_access_key]
		# region: 'your_region' #リビジョンを入れる
	}
	config.fog_directory = 'your_bucket_name'
	config.asset_host = ''#AWS S3のパケット名
else
  config.storage :file #開発環境はpublic/uplodersに保存する
	config.enable.processing:false if Rails.env.test?
 end
end