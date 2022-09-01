class MoviesController < ApplicationController
  skip_before_action :authenticate_user!

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
    @directors = @movie.castings.where(role: "Réalisateur")
    @actors = @movie.castings.where(role: "Acteur")
    @comment = Comment.new
    @interest = Interest.new
    @movie_shows = MovieShow.where(movie_id: params[:id])
    authorize @movie
  end
end
