class Ticket < ApplicationRecord
  belongs_to :departure, class_name: "Location"
  belongs_to :destination, class_name: "Location"

  validates :flight, :seat, :start_date, :price, presence: true
  validates :price, numericality: {greater_then: 0}

  validates :seat, uniqueness: {scope: [:flight, :start_date]}

  validate :should_in_other_location
  validate :in_future

  # CREATE FUNCTION tickets_fields_presence() RETURNS trigger AS $tickets_fields_presence
  #   BEGIN

  # CREATE FUNCTION tickets_fields_presence() RETURNS trigger AS $tickets_fields_presence$
  #   BEGIN
  #     -- Check that flight and price are given
  #     IF NEW.flight IS NULL THEN
  #         RAISE EXCEPTION 'flight cannot be null';
  #     END IF;

  #     IF NEW.price IS NULL THEN
  #         RAISE EXCEPTION '% cannot have null price', NEW.flight;
  #     END IF;

  #     IF NEW.seat IS NULL THEN
  #         RAISE EXCEPTION '% cannot have null seat', NEW.seat;
  #     END IF;

  #     IF NEW.start_date IS NULL THEN
  #         RAISE EXCEPTION '% cannot have null start_date', NEW.start_date;
  #     END IF;

  #     IF NEW.start_date < now()
  #         RAISE EXCEPTION '% cannot have lesser then now', NEW.start_date;
  #     END IF;

  #     IF NEW.price < 0 THEN
  #         RAISE EXCEPTION '% cannot have a negative price', NEW.price;
  #     END IF;
  #     IF NEW.destination_id == NEW.departure_id THEN
  #         RAISE EXCEPTION 'destination must be diffirence from departure '
  #     END IF;


  #     RETURN NEW;
  #   END;
  # $tickets_fields_presence$ LANGUAGE plpgsql;

  # CREATE TRIGGER tickets_fields_presence BEFORE INSERT OR UPDATE ON tickets
  #     FOR EACH ROW EXECUTE PROCEDURE tickets_fields_presence();

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