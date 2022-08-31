class MoviesController < ApplicationController

  def index
    if params[:query].present?
      @movies = Movie.where(title: params[:query])
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @directors = Casting.where(movie_id: @movie, role: 'Réalisateur')
    @actors = Casting.where(movie_id: @movie, role: 'Acteur')

    # Empty instance for new interest form
    @interest = Interest.new
  end
end
