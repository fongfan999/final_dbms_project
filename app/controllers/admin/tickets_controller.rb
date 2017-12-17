class Admin::TicketsController < Admin::ApplicationController
  before_action :set_flight, except: :index
  before_action :set_ticket, only: %i(show edit update destroy)

  def index
    @tickets = Ticket.includes(:owner, flight: [:departure, :destination]).page(params[:page])
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to [:admin, @flight, @ticket], notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ticket.update_with_optimistic_locking(ticket_params)
      redirect_to [:admin, @flight, @ticket], notice: 'Ticket was successfully updated.'
    else
      flash[:alert] = "#{@ticket.errors.full_messages.to_sentence}"
      redirect_to [:edit, :admin, @flight, @ticket]
    end
  end

  def destroy
    @ticket.destroy
    redirect_to [:admin, @flight], notice: 'Ticket was successfully destroyed.'
  end

  private
    def set_flight
      @flight = Flight.find(params[:flight_id])
    end

    def set_ticket
      @ticket = @flight.tickets.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:price, :lock_version)
    end
end
