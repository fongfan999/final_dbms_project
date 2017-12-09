class Ticket < ApplicationRecord
  attr_writer :old_updated_time
  
  belongs_to :departure, class_name: "Location"
  belongs_to :destination, class_name: "Location"

  validate :should_in_other_location
  validate :handle_conflict

  def old_updated_time
    @old_updated_time || updated_at.to_s
  end

  private
    def should_in_other_location
      if self.departure_id == self.destination_id
        self.errors.add(:destination_id, "Destination must be diffirence from departure ")
      end  
    end 

    def handle_conflict
      if updated_at.to_s > old_updated_time
        @old_updated_time = nil

        errors.add(:base, "Someone was update this ticket please check again and update ticket again")
      end
    end


end