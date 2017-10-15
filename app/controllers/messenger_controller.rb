class MessengerController < Messenger::MessengerController
  def webhook
    logger.info "Processing the request..."
    if fb_params.first_entry.callback.message?

      buttons = Messenger::Templates::Buttons.new(
          text: 'Cześć! Jestem Jasiu, czy planujesz udać się do toalety?',
          buttons: [
              Messenger::Elements::Button.new(
                  type: 'postback',
                  title: 'Tak',
                  value: 'wantToSeeToiletTrue'
              ),
              Messenger::Elements::Button.new(
                  type: 'postback',
                  title: 'Nie',
                  value: 'doNotWantToSeeToiletTrue'
              )
          ]
      )

      Messenger::Client.send(
          Messenger::Request.new(
              buttons,fb_params.first_entry.sender_id
          )
      )
    end

    if fb_params.first_entry.callback.postback?
      if fb_params.entries.first.messagings.first.callback.payload === 'wantToSeeToiletTrue'
        if Wcstatus.last.is_busy
          Messenger::Client.send(
            Messenger::Request.new(
              Messenger::Elements::Text.new(text: 'Aktualnie łazienka jest zajęta'),
              fb_params.first_entry.sender_id
            )
          )
        elsif
          Messenger::Client.send(
              Messenger::Request.new(
                  Messenger::Elements::Text.new(text: 'Łazienka jest wolna!'),
                  fb_params.first_entry.sender_id
              )
          )
        end
        Messenger::Client.send(
            Messenger::Request.new(
                Messenger::Elements::Text.new(text: 'Mam nadzieję że moja pomoc okazała się przydatna! Miłego dnia :) '),
                fb_params.first_entry.sender_id
            )
        )
      elsif fb_params.entries.first.messagings.first.callback.payload === 'doNotWantToSeeToiletTrue'
        Messenger::Client.send(
          Messenger::Request.new(
            Messenger::Elements::Text.new(text: 'ok, żegnam'),
            fb_params.first_entry.sender_id
          )
        )
      end
    end


    #make sure to send 200 at the end
    render nothing: true, status: 200
  end
end