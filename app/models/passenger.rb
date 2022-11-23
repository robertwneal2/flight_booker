class Passenger < ApplicationRecord
  has_many :passenger_bookings, foreign_key: :passenger_id
  has_many :bookings, through: :passenger_bookings, dependent: :destroy
end
