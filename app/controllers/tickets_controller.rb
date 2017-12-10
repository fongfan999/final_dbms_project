class TicketsController < ApplicationController
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
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      flash[:alert] = "#{@ticket.errors.full_messages.to_sentence}"
      redirect_to [:edit, @ticket]
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:flight, :start_date, :price, :seat, :departure_id, :destination_id, :lock_version)
    end
end
