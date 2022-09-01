class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @movie_show = MovieShow.find(params[:movie_show_id])
    @cinema = Cinema.find(@movie_show.cinema.id)

    if @booking.save
      redirect_to cinema_path(@cinema)
    else

      render "cinemas/show", status: :unprocessable_entity
    end
    authorize @booking
  end

  private

  def booking_params
    params.permit(:movie_show_id)
  end
end
