require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ToiletTrackerApi
  class Application < Rails::Application

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    Slack.configure do |config|
      config.token = ENV['slack_api_key']
    end
    Giphy::Configuration.configure do |config|
      # config.version = THE_API_VERSION
      config.api_key = ENV['giphy_api_key']
    end

  #   require 'slack-ruby-client'

  #   # Slack.configure do |config|
  #   #   config.token = ENV['SLACK_API_TOKEN']
  #   #   fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
  #   # end

  #   client = Slack::RealTime::Client.new

  #   client.on :hello do
  #     puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
  #   end

  #   client.on :message do |data|
  #     puts data
  #     case data.text
  #     when 'bot hi' then
  #       client.web_client.chat_postMessage channel: data.channel, text: "Hi <@#{data.user}>!"
  #     when /^bot/ then
  #       client.web_client.chat_postMessage channel: data.channel, text: "Sorry <@#{data.user}>, what?"
  #     end
  #   end

  #   client.start!
  # endrequire 'slack-ruby-client'

  #   # Slack.configure do |config|
  #   #   config.token = ENV['SLACK_API_TOKEN']
  #   #   fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
  #   # end

  #   client = Slack::RealTime::Client.new

  #   client.on :hello do
  #     puts "Successfully connected, welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
  #   end

  #   client.on :message do |data|
  #     puts data
  #     case data.text
  #     when 'bot hi' then
  #       client.web_client.chat_postMessage channel: data.channel, text: "Hi <@#{data.user}>!"
  #     when /^bot/ then
  #       client.web_client.chat_postMessage channel: data.channel, text: "Sorry <@#{data.user}>, what?"
  #     end
  #   end

  #   client.start!
  end
end
