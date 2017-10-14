class WcstatusesController < ApplicationController

  def index
    render json: Wcstatus.all
  end
end
