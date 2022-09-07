class CinemasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @cinema = Cinema.find(params[:id])
    @booking = Booking.new
    authorize @cinema
  end
end

def index
  @cinemas = Cinema.all
  # The `geocoded` scope filters only flats with coordinates
  @markers = @cinemas.geocoded.map do |cinema|
    {
      lat: cinema.latitude,
      lng: cinema.longitude
    }
  end
end
