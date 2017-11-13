Messenger.configure do |config|
  config.verify_token      = ENV['verify_token']
  config.page_access_token = ENV['page_access_token']
end