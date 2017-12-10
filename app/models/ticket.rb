class Ticket < ApplicationRecord
  belongs_to :departure, class_name: "Location"
  belongs_to :destination, class_name: "Location"

  validates :flight, :seat, :start_date, :price, presence: true

  validate :should_in_other_location
  validate :in_future

  def update_with_optimistic_locking(attributes)
    update(attributes)

    rescue ActiveRecord::StaleObjectError
      errors.add(:base, "Someone was update this ticket please check again and update ticket again")
      changes.except(:updated_at, :lock_version).each do |name, value|
        errors.add(name.to_sym, "was #{value.first}")
      end

      false
  end

  private
    def should_in_other_location
      if self.departure_id == self.destination_id
        self.errors.add(:destination_id, "Destination must be diffirence from departure ")
      end
    end 

    def in_future
      if self.start_date.to_date <= Time.zone.now.to_date
        errors.add(:start_date, "Start date must be greater than now!")
      end
    end
end