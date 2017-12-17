class Admin::VersionsController < Admin::ApplicationController
  def index
    @ticket = Ticket.find(params[:ticket_id])
    @tickets = TicketService.versions_to_objects(@ticket)
    @tickets = Kaminari.paginate_array(@tickets).page(params[:page])
  end
end
