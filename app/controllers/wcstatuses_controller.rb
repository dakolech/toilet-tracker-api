class WcstatusesController < ApplicationController

  def index
    if params['date-from'].nil? || params['date-to'].nil?
      wc_statuses = Wcstatus.all
    else
      # binding.pry
      wc_statuses = Wcstatus.where(created_at: Time.parse(params['date-from'])..Time.parse(params['date-to']))
    end
    busy_time = calculate_busy_time(wc_statuses)
    render json: wc_statuses, meta: { totalMin: busy_time }
  end

  def create
    client = Slack::Web::Client.new
    occupant = ['przemekf', 'daniel', 'franek'].sample

    if params[:data][:attributes]['is-busy']
      client.chat_postMessage(channel: '#devcamp-hackathon', text: "Ktos zajął toaletę!", as_user: true)
    elsif
      client.chat_postMessage(channel: '#devcamp-hackathon', text: "Toaleta się zwolniła!", as_user: true)
    end
    # gif = Giphy.search('funny cat', {limit: 1, offset: 25}).first.embed_url.to_s
    # client.chat_postMessage(channel: '#devcamp-hackathon', text: gif, as_user: true) if occupant == 'franek'
    wcstatus = Wcstatus.create({is_busy: params[:data][:attributes]['is-busy']})
    render json: wcstatus
  end

  private

  def calculate_busy_time(wc_statuses)
    busy_time = 0
    entrance_time = nil
    leave_time = nil
    wc_statuses.each do |wc_status|
      if wc_status.is_busy == true
        entrance_time = wc_status.created_at
      elsif
        leave_time = wc_status.created_at
        busy_time = busy_time + (leave_time - entrance_time || Time.now)
      end
    end
    (busy_time/60).to_i
  end
end
