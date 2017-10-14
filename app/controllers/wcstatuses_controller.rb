class WcstatusesController < ApplicationController

  def index
    # Wcstatus.create(is_busy: true)
    Wcstatus.all
  end
end
