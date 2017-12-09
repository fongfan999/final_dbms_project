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
    if @ticket.updated_at.to_s <= old_updated_time
      if @ticket.update(ticket_params)
        redirect_to @ticket, notice: 'Ticket was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to :root, arlet: "Someone was update this ticket please check again and update ticket again"
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
      params.require(:ticket).permit(:flight, :start_date, :price, :quantity, :departure_id, :destination_id)
    end

    def old_updated_time
      params[:ticket][:updated_at].to_datetime.in_time_zone
    end
end
