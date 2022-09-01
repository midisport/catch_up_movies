class CinemasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @cinema = Cinema.find(params[:id])
    @movie_shows = MovieShow.where(cinema_id: @cinema.id)
    @booking = Booking.new
    authorize @cinema
  end
end
