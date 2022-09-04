class InterestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @user = User.find(params[:user_id])
    @interests = policy_scope(Interest)
    @interests = Interest.includes(:user, :movie).where(user: @user)
    params[:user_id].present? ? @user = User.find(params[:user_id]) : @user = User.find(:id)
    @interest_shows = movie_shows_for_movies_in_watchlist(@interests)
    @follow = Follow.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @interested_user = current_user

    @interest = Interest.new(movie: @movie, user: @interested_user) # refactor this to use strong params

    authorize @interest

    if @interest.save
      redirect_to user_interests_path(@interested_user)
    else
      @directors = @movie.castings.where(role: "Réalisateur")
      @actors = @movie.castings.where(role: "Acteur")
      @movie_shows = MovieShow.where(movie_id: params[:id])
      @markers = @movie.cinemas.geocoded.map do |cinema|
        {
          lat: cinema.lat,
          lng: cinema.lng
        }
      end
      @comment = Comment.new

      render "movies/show", status: :unprocessable_entity
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    redirect_to user_interests_path(current_user), status: :see_other
    authorize @interest
  end

  private

  def movie_shows_for_movies_in_watchlist(interests)
    interest_shows = []
    interest_movies = interests.map(&:movie)
    MovieShow.includes(:cinema, :movie).all.each do |show|
      interest_shows << show if interest_movies.include?(show.movie)
    end
    return interest_shows
  end
end
