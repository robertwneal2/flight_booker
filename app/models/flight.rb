class Flight < ApplicationRecord
  validates: :start, :duration, presence: true

  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"
end
