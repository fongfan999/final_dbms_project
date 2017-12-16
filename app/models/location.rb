class Location < ApplicationRecord
  has_many :departure_ticket, 
    class_name: 'Ticket', 
    foreign_key: :departure_id
    
  has_many :destination_ticket, 
    class_name: 'Ticket', 
    foreign_key: :destination_id
end
