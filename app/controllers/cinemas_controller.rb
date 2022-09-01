class CinemasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
end

def index
  @cinemas = Cinema.all
  # The `geocoded` scope filters only flats with coordinates
  @markers = @cinemas.geocoded.map do |flat|
    {
      lat: flat.latitude,
      lng: flat.longitude
    }
  end
end
