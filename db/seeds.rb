# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Flight.destroy_all
Airport.destroy_all

airports = [
  'LAX',
  'SBA',
  'SFO',
  'DFW',
  'ATL',
  'DEN',
  'ORD',
  'CLT',
  'MCO',
  'LAS'
]

airports.each do |airport_code| 
  Airport.create(code: airport_code)
end

airport_objects = Airport.all
number_of_flights = 100
now = Time.now
in_one_year = now + 60 * 60 * 24 * 365 

number_of_flights.times do 
  flight = Flight.new
  flight.duration = rand(15..900)
  flight.start = rand(now..in_one_year)
  arrival = airport_objects.sample
  departure = airport_objects.sample
  until arrival != departure
    arrival = airport_objects.sample
  end
  flight.arrival = arrival
  flight.departure = departure
  flight.save
end