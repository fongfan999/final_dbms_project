class Ticket < ApplicationRecord
  belongs_to :flight
  
  validates :seat, :price, presence: true
  validates :seat, uniqueness: {scope: [:flight_id]}
  validates :price, numericality: {greater_then: 0}


  def update_with_optimistic_locking(attributes)
    update(attributes)

    rescue ActiveRecord::StaleObjectError
      errors.add(:base, "Someone was update this ticket please check again and update ticket again")
      changes.except(:updated_at, :lock_version).each do |name, value|
        errors.add(name.to_sym, "was #{value.first}")
      end

      false
  end
end