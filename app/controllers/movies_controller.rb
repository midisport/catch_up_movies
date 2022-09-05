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
    @movie_show = MovieShow.where(movie_id: @movie)
    @directors = @movie.castings.where(role: "Réalisateur")
    @actors = @movie.castings.where(role: "Acteur")
    @comment = Comment.new
    @interest = Interest.new
    @movie_shows = MovieShow.includes(:cinema).where(movie_id: params[:id])
    @booking = Booking.new
    authorize @movie
    @markers = @movie.cinemas.geocoded.map do |cinema|
      {
        lat: cinema.lat,
        lng: cinema.lng,
        info_window: render_to_string(partial: "info_window", locals: {cinema: cinema}),
        image_url: helpers.asset_url("ecran-de-cinema.png")
      }
    end
  end
end
