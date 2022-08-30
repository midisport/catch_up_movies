class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[index show]

  def index
    @movies = Movie.all
    authorize @movies
  end

  def show
    @movie = Movie.find(params[:id])
    @directors = Casting.where(movie_id: @movie, role: 'Réalisateur')
    @actors = Casting.where(movie_id: @movie, role: 'Acteur')
    authorize @movie
  end
end
