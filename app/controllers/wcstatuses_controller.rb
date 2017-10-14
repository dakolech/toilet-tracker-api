class WcstatusesController < ApplicationController

  def index
    render json: Wcstatus.all
  end

  def create
    puts params[:wctatus].inspect
    wcstatus = Wcstatus.create(params[:wctatus])
    puts wcstatus.is_busy
    render json: wcstatus
  end
end
