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

    wcstatus = Wcstatus.create(params[:wctatus])
    puts wcstatus.is_busy
    render json: wcstatus
  end
end
