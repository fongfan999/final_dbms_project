class Ticket < ApplicationRecord
  belongs_to :departure, class_name: "Location"
  belongs_to :destination, class_name: "Location"

  validate :should_in_other_location

  private
    def should_in_other_location
      if self.departure_id == self.destination_id
        self.errors.add(:destination_id, "Destination must be diffirence from departure ")
      end  
    end 
end
