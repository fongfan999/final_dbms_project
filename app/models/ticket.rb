class Ticket < ApplicationRecord
  TRACKING_ATTRS = %w(price owner_id).freeze

  has_paper_trail only: TRACKING_ATTRS

  belongs_to :flight
  belongs_to :owner, class_name: 'User', optional: true

  scope :available, -> { where(owner_id: nil) }

  validates :seat, :price, presence: true
  validates :seat, uniqueness: {scope: [:flight_id]}
  validates :price, numericality: {greater_than: 0}
  validates :owner_id, uniqueness: { scope: :flight_id }, allow_nil: true

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