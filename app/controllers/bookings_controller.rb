class BookingsController < ApplicationController
  def create
    service = BookingService.new(current_user, params[:ticket_id])
    message = service.book!

    redirect_to root_path, message
  end
end
