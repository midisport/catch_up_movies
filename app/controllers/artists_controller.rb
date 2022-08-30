class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @artist = Artist.find(params[:id])
    @movie = Movie.where(artist_id: @artist)
    raise
  end
end
