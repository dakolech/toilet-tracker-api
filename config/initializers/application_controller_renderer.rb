# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )
ActiveModelSerializers.config.adapter = :json_api
ActiveModelSerializers.config.key_transform = :dash
