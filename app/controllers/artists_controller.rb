class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    @movie = Movie.where(artist_id: @artist)
    raise
  end
end
