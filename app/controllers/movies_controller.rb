class MoviesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      sql_query = <<~SQL
        movies.title @@ :query
        OR artists.name @@ :query
      SQL
      @movies = policy_scope(Movie).joins(:artists).where(sql_query, query: "%#{params[:query]}%")
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
    @markers = @movie.cinemas.geocoded.map do |cinema|
      {
        lat: cinema.lat,
        lng: cinema.lng
      }
    end
  end
end
