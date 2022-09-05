class InterestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_interest, only: [:destroy, :update]
  def index
    @user = User.find(params[:user_id])
    @interests = policy_scope(Interest)
    @unseen_interests = Interest.includes(:user, :movie).where(user: @user, seen: false)
    @seen_interests = Interest.includes(:user, :movie).where(user: @user, seen: true)
    params[:user_id].present? ? @user = User.find(params[:user_id]) : @user = User.find(:id)

    @follow = Follow.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @interested_user = current_user

    @interest = Interest.new(movie: @movie, user: @interested_user) # refactor this to use strong params
    @movie_show = MovieShow.where(movie_id: @movie)

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
          lng: cinema.lng,
          info_window: render_to_string(partial: "movies/info_window", locals: { cinema: cinema },),
          image_url: helpers.asset_url("ecran-de-cinema.png")
        }
      end

      @comment = Comment.new
      render "movies/show", status: :unprocessable_entity
    end
  end

  def update
    @interest.update(interest_params)
    @interests = policy_scope(Interest)
    @user = User.find(params[:id])
    @interests = Interest.includes(:user, :movie).where(user: @user)
    @unseen_interests = Interest.includes(:user, :movie).where(user: @user, seen: false)
    @seen_interests = Interest.includes(:user, :movie).where(user: @user, seen: true)
    @interests = Interest.includes(:movie, :user).where(user: @user)

    render "interests/watchlist"
    authorize @interest
  end

  def destroy
    @interest.destroy
    redirect_to user_interests_path(current_user), status: :see_other
    authorize @interest
  end

  private

  def set_interest
    @interest = Interest.find(params[:id])
  end

  def interest_params
    params.require(:interest).permit(:seen)
  end

  def movie_shows_for_movies_in_watchlist(interests)
    interest_shows = []
    interest_movies = interests.map(&:movie)
    MovieShow.includes(:cinema, :movie).all.each do |show|
      interest_shows << show if interest_movies.include?(show.movie)
    end
    return interest_shows
  end
end
