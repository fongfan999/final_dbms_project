class TicketService
  def self.versions_to_objects(ticket)
    ticket.versions.reverse_order.map do |version|
      [ticket.paper_trail.version_at(version.created_at), version.created_at]
    end
  end
end