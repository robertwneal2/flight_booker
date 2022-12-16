class PassengerMailer < ApplicationMailer
  default from: 'notifications@bookings.com'

  def booking_email
    @passenger = params[:passenger]
    @flight = params[:flight]
    @url = search_url
    mail(to: @passenger.email, subject: "#{@flight.departure.code} to #{@flight.arrival.code} Flight Booking")
  end
end
