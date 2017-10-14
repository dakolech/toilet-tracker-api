class WcstatusesController < ApplicationController

  def index
    render json: Wcstatus.all
  end

  def create
    client = Slack::Web::Client.new
    puts params.inspect

    # all_members = []

    # client.users_list(presence: true, limit: 10) do |response|
    #   all_members.concat(response.members)
    # end

    # puts all_members.inspect

    # occupant = ['przemekf', 'daniel', `franek`].sample
    occupant = ['franek'].sample

    client.chat_postMessage(channel: '#devcamp-hackathon', text: "<@#{occupant}> zajął toaletę!", as_user: true)
    gif = Giphy.search('funny cat', {limit: 1, offset: 25}).first.embed_url.to_s
    client.chat_postMessage(channel: '#devcamp-hackathon', text: gif, as_user: true)
    wcstatus = Wcstatus.create(params[:wctatus])
    puts wcstatus.is_busy
    render json: wcstatus
  end

  private

  # def bot_gif_send

  #   client.files_upload(
  #     channels: '#devcamp-hackathon',
  #     as_user: true,
  #     file: Faraday::UploadIO.new('/path/to/avatar.jpg', 'image/jpeg'),
  #     title: 'My Avatar',
  #     filename: 'avatar.jpg',
  #     initial_comment: 'Attached a selfie.'
  #   )
  # end
end
