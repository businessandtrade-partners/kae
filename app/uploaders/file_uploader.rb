class FileUploader < CarrierWave::Uploader::Base
  POSSIBLE_IMG_EXTENSIONS = %w[jpg jpeg gif png]
  POSSIBLE_DOC_EXTENSIONS = %w[chm csv diff doc docx dot dxf eps gml ics kml odp ods odt pdf ppt pptx ps rdf rtf sch txt wsdl xls xlsm xlsx xlt xsd xslt zip msg]

  storage :fog

  def store_dir
    "uploads/#{base_dir}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def read
    clean? ? read_from_permanent_storage : super
  end

  def extension_allowlist
    POSSIBLE_IMG_EXTENSIONS + POSSIBLE_DOC_EXTENSIONS
  end

  def filename
    "#{@original_filename.gsub(/\W/, "").gsub(/#{file.extension}\z/, "")}.#{file.extension}" if @original_filename.present?
  end

  def fog_directory
    clean? ? ENV["AWS_S3_PERMANENT_BUCKET"] : ENV["AWS_S3_TMP_BUCKET"]
  end

  def permanent_path
    path.sub("tmp", "permanent")
  end

  private

  def base_dir
    clean? ? "permanent" : "tmp"
  end

  def clean?
    model.respond_to?(:clean?) && model.clean?
  end

  def read_from_permanent_storage
    if Rails.env.production? || ENV["ENABLE_VIRUS_SCANNER_BUCKETS"] == "true"
      permanent_file = CarrierWave::Storage::Fog::File.new(self, permanent_storage, store_path)
      permanent_file.read
    else
      File.read(permanent_path)
    end
  end

  def permanent_storage
    @permanent_storage ||= CarrierWave::Storage::Fog.new(self)
  end

  def tmp_bucket_credentials
    Rails.logger.info "tmp_bucket_credentials"
    {
      provider: "AWS",
      use_iam_profile: true,
      aws_access_key_id: "",
      aws_secret_access_key: "",
      region: ENV["AWS_REGION"],
    }
  end

  def clean_bucket_credentials
    Rails.logger.info "clean_bucket_credentials"
    {
      provider: "AWS",
      use_iam_profile: true,
      aws_access_key_id: "",
      aws_secret_access_key: "",
      region: ENV["AWS_REGION"],
    }
  end
end
