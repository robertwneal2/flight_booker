class BookingsController < ApplicationController
  def new
    flight_id = flight_params[:flight_id]
    @flight = Flight.where(id: flight_id)
    num_passengers = flight_params[:num_passengers].to_i
    @passengers = []
    num_passengers.times { @passengers << Passenger.new }
  end

  private

  def flight_params
    params.permit(:flight_id, :num_passengers, :commit)
  end

  def booking_params
    params.require(:booking).permit(:flight_id)
  end
end
