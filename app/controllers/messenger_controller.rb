class MessengerController < Messenger::MessengerController
  def webhook
    logger.info "Processing the request..."
    if fb_params.first_entry.callback.message?
      Messenger::Client.send(
          Messenger::Request.new(
              Messenger::Elements::Text.new(text: 'No cześć, jestem Jasiu!'),
              fb_params.first_entry.sender_id
          )

      #Messenger::MessengerController::req
      )
    end

    #make sure to send 200 at the end
    render nothing: true, status: 200
  end
end