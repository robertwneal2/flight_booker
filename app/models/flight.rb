class Flight < ApplicationRecord
  validates :start, :duration, presence: true

  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"

  def self.all_unique_dates 
    event_dates = Flight.find_by_sql("select distinct date(start) from flights order by date(start) asc")
  end

  def date_formatted
    date.strftime("%m/%d/%Y")
  end

  def start_to_date
    self.start.to_date
  end
end
