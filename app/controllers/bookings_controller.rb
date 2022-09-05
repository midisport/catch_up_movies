class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  def index
    @bookings = policy_scope(Booking)
    @user = User.find(params[:user_id])
    @bookings = Booking.includes(:movie_shows).where(user: @user)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @movie_show = MovieShow.find(params[:movie_show_id])
    @cinema = Cinema.find(@movie_show.cinema.id)

    authorize @booking

    if @booking.save
      redirect_to "/dashboard/#{current_user.id}"
    else
      render "cinemas/show", status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to "/dashboard/#{current_user.id}", status: :see_other
    authorize @booking
  end

  private

  def booking_params
    params.permit(:movie_show_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
