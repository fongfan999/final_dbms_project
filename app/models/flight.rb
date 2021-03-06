class Flight < ApplicationRecord
  attr_accessor :price

  belongs_to :departure, class_name: "Location"
  belongs_to :destination, class_name: "Location"
  has_many :tickets, dependent: :destroy

  validates :start_time, :flight_model, :quantity, presence: true
  validates :quantity, numericality: {greater_than_or_equal_to: 0}
  validates :flight_model, uniqueness: {scope: [:start_time], message: "The flight already created with  start time"}
  validate :should_in_other_location
  validate :in_future

  before_create :create_tickets

  accepts_nested_attributes_for :tickets

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
  private
    def should_in_other_location
      if self.departure_id == self.destination_id
        self.errors.add(:destination_id, "Destination must be diffirence from departure ")
      end
    end

    def in_future
      if self.start_time.to_date <= Date.current
        errors.add(:start_date, "Start date must be greater than now!")
      end
    end

    def create_tickets
      self.tickets_attributes =
        quantity.times.map do |index|
          { seat: generate_ticket_seat(index + 1), price: price, flight_id: id }
        end
    end

    def generate_ticket_seat(i)
      "#{flight_model.upcase}_#{i}"
    end
end