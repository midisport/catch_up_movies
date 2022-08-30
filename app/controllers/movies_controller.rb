class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @directors = Casting.where(movie_id: @movie, role: director)
    @actors = Casting.where(movie_id: @movie, role: actor)
  end
end
