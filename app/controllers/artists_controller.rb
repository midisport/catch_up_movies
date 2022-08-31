class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @artist = Artist.find(params[:id])
    @movies = @artist.movies
    authorize @artist
  end
end
