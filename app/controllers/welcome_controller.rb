class WelcomeController < ApplicationController
  def index
    @tickets =
      Ticket.available
        .includes(:owner, flight: [:departure, :destination])
        .page(params[:page])
  end
end
