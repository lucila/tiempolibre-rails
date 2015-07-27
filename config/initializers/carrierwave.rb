# NullStorage provider for CarrierWave for use in tests.  Doesn't actually
# upload or store files but allows test to pass as if files were stored and
# the use of fixtures.
class NullStorage
  attr_reader :uploader

  def initialize(uploader)
    @uploader = uploader
  end

  def identifier
    uploader.filename
  end

  def store!(_file)
    true
  end

  def retrieve!(_identifier)
    true
  end
end

CarrierWave.configure do |config|
  config.fog_use_ssl_for_aws = false

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage NullStorage
    # Required to prevent FactoryGirl from giving an infuriating exception
    # ArgumentError: wrong exec option
    # It also speeds up tests so it's a good idea
    config.enable_processing = false
  elsif Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/public"
    config.asset_host = 'http://localhost:3000'
  else
    amazons3 = AppConfiguration.for(:amazons3)
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: amazons3.key,
      aws_secret_access_key: amazons3.secret,
      region: amazons3.region,
      path_style: true
    }
    config.storage = :fog
    config.fog_use_ssl_for_aws = false
    config.fog_directory = amazons3.bucket_name
    config.fog_public = true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  end

  # To let CarrierWave work on heroku
  config.cache_dir = "#{Rails.root}/public/uploads"
end
