class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passenger_bookings, foreign_key: :booking_id
  has_many :passengers, through: :passenger_bookings, dependent: :destroy
  accepts_nested_attributes_for :passengers
end
