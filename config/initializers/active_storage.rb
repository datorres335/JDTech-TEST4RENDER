Rails.application.config.to_prepare do
    ActiveStorage::Blob.service.instance_variable_set(:@checksum, nil)
  end
  