class Location < ApplicationRecord
  has_many :departure_flights, 
    class_name: 'Flight', 
    foreign_key: :departure_id
    
  has_many :destination_flights, 
    class_name: 'Flight', 
    foreign_key: :destination_id
end
