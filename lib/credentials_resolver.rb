module CredentialsResolver
  module_function

  def redis_uri
    ENV["REDIS_ENDPOINT"].presence || JSON.parse(ENV["VCAP_SERVICES"])["redis"][0]["credentials"]["uri"]
  rescue
    ENV["REDIS_URL"]
  end

  def pgsql_uri
    if ENV["DATABASE_CREDENTIALS"].present?
      parse_database_config(ENV["DATABASE_CREDENTIALS"])
    else
      # Fallback to the original logic
      JSON.parse(ENV["VCAP_SERVICES"])["postgres"][0]["credentials"]["uri"]
    end
  rescue
    ENV["DATABASE_URL"]
  end

  def parse_database_config(config_json)
    config = JSON.parse(config_json)

    # Construct the database URI
    "#{config["engine"]}://#{config["username"]}:#{config["password"]}@#{config["host"]}:#{config["port"]}/#{config["dbname"]}"
  end

  def tmp_bucket_access_key_id
    s3_bucket_credentials(ENV["AWS_S3_TMP_BUCKET"]).fetch(:aws_access_key_id, nil)
  end

  def tmp_bucket_secret_access_key
    s3_bucket_credentials(ENV["AWS_S3_TMP_BUCKET"]).fetch(:aws_secret_access_key, nil)
  end

  def clean_bucket_access_key_id
    s3_bucket_credentials(ENV["AWS_S3_PERMANENT_BUCKET"]).fetch(:aws_access_key_id, nil)
  end

  def clean_bucket_secret_access_key
    s3_bucket_credentials(ENV["AWS_S3_PERMANENT_BUCKET"]).fetch(:aws_secret_access_key, nil)
  end

  def s3_bucket_credentials(bucket_name)
    return {} if ENV["VCAP_SERVICES"].blank?

    buckets = JSON.parse(ENV["VCAP_SERVICES"])["aws-s3-bucket"]
    return {} if buckets.empty?

    bucket = buckets.find { |bucket| bucket["credentials"]["bucket_name"] == bucket_name }
    return {} if bucket.nil?

    bucket["credentials"].symbolize_keys
  end
end
