Messenger.configure do |config|
  config.verify_token      = Rails.application.secrets['verify_token']
  config.page_access_token = Rails.application.secrets['page_access_token']
end