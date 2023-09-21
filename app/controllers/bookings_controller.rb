class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = Car.find(params[:car_id])
    @booking.total_cost = @booking.car.price_per_day * total
    if @booking.save
      redirect_to car_path(@booking.car)
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def total
    params.require(:booking).permit(:start_date, :end_date)
    days = @booking.end_date - @booking.start_date
    return days
  end
end
