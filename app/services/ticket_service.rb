class TicketService
  attr_reader :ticket, :version

  def initialize(ticket, version_id)
    @ticket = ticket
    @version = ticket.versions.find(version_id)
  end

  def self.versions_to_objects(ticket)
    ticket.versions.reverse_order.map do |version|
      [version.reify, version]
    end
  end

  def reify_and_save!
    changed_attributes = version.reify.attributes.slice(*Ticket::TRACKING_ATTRS)

    if ticket.update(changed_attributes)
      { notice: 'The version was restored successfully' }
    else
      { alert: 'Something went wrong' }
    end
  end
end
