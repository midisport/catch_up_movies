require "open-uri"

class MoviesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      omdb_search_and_create_movies(params[:query])
      sql_query = "movies.title @@ :query"
      @movies = policy_scope(Movie).where(sql_query, query: "%#{params[:query]}%")
      if @movies.empty?
        @movies = policy_scope(Movie)
        flash[:alert] = "This movie is not in the list! Please try again"
      end
    else
      @movies = policy_scope(Movie)

    end
    @markers = Cinema.next_days_shows.near('paris', 2).map do |cinema|
      {
        lat: cinema.latitude,
        lng: cinema.longitude,
        info_window: render_to_string(partial: "movies/info_window", locals: { cinema: cinema },),
        image_url: helpers.asset_url("logo-purple.png")
      }
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_show = MovieShow.where(movie_id: @movie)
    @comment = Comment.new
    @interest = Interest.new
    @movie_shows = MovieShow.includes(:cinema).where(movie_id: params[:id])
    @booking = Booking.new
    authorize @movie
    @markers = @movie.cinemas.geocoded.map do |cinema|
      {
        lat: cinema.lat,
        lng: cinema.lng,
        info_window: render_to_string(partial: "info_window", locals: { cinema: cinema },),
        image_url: helpers.asset_url("logo-purple.png")
      }
    end
  end

  private

  def omdb_search_and_create_movies(query)
    url = "http://www.omdbapi.com/?apikey=9695b4ac&s=#{query}&type=movie"
    response = URI.open(url).read
    results = JSON.parse(response)
    movies = results["Search"]
    unless movies.nil?
      movies.each do |movie|
        if  Movie.where(imdbid: movie["imdbID"]).empty?
          url = "http://www.omdbapi.com/?apikey=9695b4ac&i=#{movie['imdbID']}"
          answer = URI.open(url).read
          film = JSON.parse(answer)
          Movie.create(
            title: film["Title"],
            synopsis: film["Plot"],
            duration: film["Runtime"],
            poster: (film["Poster"] == "N/A" || film["Poster"] == "") ? nil : film["Poster"],
            original_language: film["Language"],
            country: film["Country"],
            genre: film["Genre"],
            imdb_rating: film["imdbRating"],
            release_date: film["Year"],
            director: film["Director"],
            actors: film["Actors"],
            imdbid: film["imdbID"]
          )
        end
      end
    end
  end
end
