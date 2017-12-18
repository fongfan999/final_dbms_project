class WelcomeController < ApplicationController
  def index
    @tickets =
      Ticket.available
        .includes(:owner, flight: [:departure, :destination])

    if params[:welcome]
      @tickets = 
        Ticket.search(params[:welcome])
       @tickets = Kaminari.paginate_array(@tickets)
    end

    @tickets = @tickets.page(params[:page])
  end
end
