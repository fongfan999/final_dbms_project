class Admin::FlightsController < Admin::ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  def index
    @flights = Flight.all
  end

  def show
    @tickets = @flight.tickets.includes(:owner).page(params[:page])
  end

  def new
    @flight = Flight.new
  end

  def edit
    @flight
  end

  def create
    @flight = Flight.new(flight_params)
    
    if @flight.save
      redirect_to [:admin, @flight], notice: 'Flight was successfully created.'
    else
      flash[:alert] = @flight.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @flight.lock!
    sleep 10
    if @flight.update(flight_params)
      redirect_to [:admin, @flight], notice: 'Flight was successfully updated.'
    else
      flash[:alert] = @flight.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @flight.destroy
    redirect_to admin_flights_url, notice: 'Flight was successfully destroyed.'
  end

  private
    def set_flight
      @flight = Flight.includes(:tickets).find(params[:id])
    end

    def flight_params
      params.require(:flight).permit(:start_time, :departure_id, :destination_id, :quantity, :price, :flight_model)
    end
end
