require 'json'

service_account_file = '/etc/secrets/vocal-etching-452700-q3-df039a91c07c.json'
if File.exist?(service_account_file)
  service_account_data = JSON.parse(File.read(service_account_file))
  # Use the service account data as needed
  # For example, setting up Google Cloud credentials
  ENV['GOOGLE_CLOUD_PROJECT'] = service_account_data['project_id']
  ENV['GOOGLE_APPLICATION_CREDENTIALS'] = service_account_file
end