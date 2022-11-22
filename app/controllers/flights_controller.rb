class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    @flights = Flight.all.includes(:arrival, :departure)
  end

  def search
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id]}
    @dates = Flight.all_unique_dates
    if search_params[:commit]
      @date = search_params[:date]
      day_start = @date.to_time
      day_end = day_start + (60*60*24-1)
      @arrival_id = search_params[:arrival_id]
      @departure_id = search_params[:departure_id]
      @num_passengers = search_params[:num_passengers]
      @search_result_flights = Flight.where([
        "arrival_id = :arrival_id and
        departure_id = :departure_id and
        start >= :day_start and
        start <= :day_end",
        { 
          arrival_id: @arrival_id, 
          departure_id: @departure_id, 
          day_start: day_start, 
          day_end: day_end 
        }
      ]).order(:start)
      if @search_result_flights.empty?
        @search_result_flights = 'No flights found'
      end
    end
  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully updated." }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy

    respond_to do |format|
      format.html { redirect_to flights_url, notice: "Flight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:arrival_id, :departure_id, :start, :duration)
    end

    def search_params
      params.permit(:arrival_id, :departure_id, :date, :duration, :num_passengers, :commit)
    end
end
