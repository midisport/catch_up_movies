class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[index show]

  def index
    if params[:query].present?
      sql_query = <<~SQL
        movies.title ILIKE :query
        OR artists.name ILIKE :query
      SQL
      @movies = policy_scope(Movie.joins(:castings).joins(:artists).where(sql_query, query: "%#{params[:query]}%"))
    else
      @movies = policy_scope(Movie)
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @directors = @movie.artists
    @actors = @movie.artists
    @comment = Comment.new
    @interest = Interest.new

    authorize @movie
  end
end
