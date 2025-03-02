Rails.application.config.to_prepare do
    module ActiveStorage
      class Service::S3Service
        def upload(key, io, checksum: nil, **options)
          instrument :upload, key: key do
            io.rewind
            data = io.read
            # Now, do not pass any checksum-related option to put_object.
            client.client.put_object(
              bucket: bucket.name,  # ensure a string is passed
              key: key,
              body: data,
              # Explicitly set content_md5 to nil to avoid sending it.
              content_md5: nil,
              **options.except(:checksum, :custom_metadata)
            )
          end
        end
      end
    end
  end
  
  