class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight_id = flight_params[:flight_id]
    num_passengers = flight_params[:num_passengers].to_i
    num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        send_booking_emails(@booking)

        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def send_booking_emails(booking)
    passengers = booking.passengers
    flight = booking.flight
    passengers.each do |passenger|
      PassengerMailer.with(passenger: passenger, flight: flight).booking_email.deliver_later
    end
  end

  private

  def flight_params
    params.permit(:flight_id, :num_passengers, :commit)
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
