class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    @movies = @artist.movies
  end
end
