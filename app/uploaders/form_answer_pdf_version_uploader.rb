class FormAnswerPdfVersionUploader < CarrierWave::Uploader::Base
  def filename
    if original_filename.present?
      "#{original_filename.split("_SEPARATOR")[0]}.#{file.extension}"
    end
  end

  def read
    if Rails.env.production? || ENV["ENABLE_VIRUS_SCANNER_BUCKETS"] == "true"
      permanent_file = CarrierWave::Storage::Fog::File.new(self, permanent_storage, store_path)
      permanent_file.read
    else
      File.read(path)
    end
  end

  def permanent_storage
    @permanent_storage ||= CarrierWave::Storage::Fog.new(self)
  end

  def fog_directory
    ENV["AWS_S3_PERMANENT_BUCKET"]
  end

  def fog_credentials
    {
      provider: "AWS",
      aws_access_key_id: ENV["AWS_PERMANENT_BUCKET_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_PERMANENT_BUCKET_SECRET_ACCESS_KEY"],
      region: ENV["AWS_REGION"],
    }
  end

  def extension_allowlist
    %w[pdf]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
