class BookingService
  attr_reader :owner, :ticket_id

  def initialize(owner, ticket_id)
    @owner, @ticket_id = owner, ticket_id
  end

  def book!
    @ticket = Ticket.available.find(ticket_id)
    
    @ticket.with_lock do
      if @ticket.update(owner_id: owner.id)
        @ticket.flight.update(quantity: @ticket.flight.quantity - 1)
        { notice: "You've successfully booked" }
      elsif this_flight_was_booked?
        { alert: "You've already booked the ticket this flight" }
      else
        { alert: 'Something went wrong. Please try again' }
      end
    end
  rescue ActiveRecord::RecordNotFound
    { alert: 'This ticket is not available anymore :(' }
  end

  private

  def this_flight_was_booked?
    @ticket.errors.messages.keys.include?(:owner_id)
  end
end
