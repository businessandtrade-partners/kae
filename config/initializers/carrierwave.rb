require "carrierwave"
require "carrierwave/storage/fog"
require "fog/aws"
require 'aws-sdk-s3'

Aws.config.update({
  region: ENV["AWS_REGION"],
  credentials: Aws::ECSCredentials.new
})

class CustomStorage
  def self.new(uploader)
    if Rails.env.production? || ENV["ENABLE_VIRUS_SCANNER_BUCKETS"] == "true"
      CustomFogStorage.new(uploader)
    else
      CustomFileStorage.new(uploader)
    end
  end
end

class CustomFogStorage < CarrierWave::Storage::Fog
end

class CustomFileStorage < CarrierWave::Storage::File
  def retrieve!(identifier)
    file = super
    if file.respond_to?(:uploader) && file.uploader.model.respond_to?(:clean?) && file.uploader.model.clean?
      new_path = file.path.sub("/tmp/", "/permanent/")
      FileUtils.mkdir_p(File.dirname(new_path))
      FileUtils.mv(file.path, new_path) unless File.exist?(new_path)
      file.instance_variable_set(:@path, new_path)
    end
    file
  end
end

CarrierWave.configure do |config|
  if Rails.env.production? || ENV["ENABLE_VIRUS_SCANNER_BUCKETS"] == "true"
    Rails.logger.info "Environment is production. Initialising fog credentials"
    config.fog_credentials = {
      provider: "AWS",
      use_iam_profile: true,
      region: ENV["AWS_REGION"],
    }
    Rails.logger.info "Fog credentials initialised"
    config.fog_directory = ENV["AWS_S3_TMP_BUCKET"]
    config.storage = :fog
    config.fog_public = false
    config.cache_dir = "/tmp/carrierwave"
    config.cache_storage = :fog
  else
    Rails.logger.info "Environment is not production."
    config.storage = :file
    config.enable_processing = false if Rails.env.test?
    config.root = Rails.root.join("public")
    config.cache_dir = "uploads/tmp"
    config.cache_storage = :file
  end
  config.storage_engines = { custom: "CustomStorage" }
end
