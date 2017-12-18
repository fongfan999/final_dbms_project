class WelcomeController < ApplicationController
  def index
    @tickets =
      Ticket.available
        .includes(:owner, flight: [:departure, :destination])

    if params[:welcome]
      @tickets = 
        Ticket.joins(:flight).joins("INNER JOIN locations departures ON flights.departure_id = departures.id").joins("INNER JOIN locations destinations ON flights.destination_id = destinations.id")
          .where("departures.name iLIKE ? AND destinations.name iLIKE ?", 
            "%#{params[:welcome][:departure]}%","%#{params[:welcome][:destination]}%")
       @tickets = Kaminari.paginate_array(@tickets)
    end

    @tickets = @tickets.page(params[:page])
  end
end
