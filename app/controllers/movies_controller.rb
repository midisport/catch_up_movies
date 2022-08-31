class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[index show]

  def index
    if params[:query].present?
      # @movies = Movie.where(title: params[:query])
      @movies = policy_scope(Movie.where(title: params[:query]))
    else
      @movies = policy_scope(Movie)
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @directors = @movie.artists
    @actors = @movie.artists
    authorize @movie
  end
end
