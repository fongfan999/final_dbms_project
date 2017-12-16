class TicketsController < ApplicationController
  before_action :set_flight
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
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
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ticket.update_with_optimistic_locking(ticket_params)
      redirect_to [@flight, @ticket], notice: 'Ticket was successfully updated.'
    else
      flash[:alert] = "#{@ticket.errors.full_messages.to_sentence}"
      redirect_to edit_flight_ticket_path(@flight, @ticket)
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
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
