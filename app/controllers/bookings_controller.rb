class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
    @user = User.find(params[:user_id])
    @bookings = Booking.where(user: @user)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @movie_show = MovieShow.find(params[:movie_show_id])
    @cinema = Cinema.find(@movie_show.cinema.id)

    authorize @cinema
    authorize @movie_show
    authorize @booking

    if @booking.save
      redirect_to "/dashboard/#{current_user.id}"
    else
      render "cinemas/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.permit(:movie_show_id)
  end
end
