# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

SlackRubyBotServer::App.instance.prepare!
SlackRubyBotServer::Service.start!

run SlackRubyBotServer::Api::Middleware.instance
run Rails.application
