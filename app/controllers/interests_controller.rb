class InterestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_interest, only: %I[destroy update]

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
    authorize @interest
    @movie_show = MovieShow.where(movie_id: @movie)


    if @interest.save
      if params[:source] == "movie"
        flash[:notice] = "#{@movie.title} was added to your Watchlist"
        redirect_to movie_path(@interest.movie), status: :see_other
      else
        flash[:notice] = "#{@movie.title} was added to your Watchlist"
        redirect_to user_interests_path(@interested_user)
      end
    else
      @directors = @movie.director
      @actors = @movie.actors
      @movie_shows = MovieShow.where(movie_id: params[:id])
      @markers = @movie.cinemas.geocoded.map do |cinema|
        {
          lat: cinema.lat,
          lng: cinema.lng,
          info_window: render_to_string(partial: "movies/info_window", locals: { cinema: cinema },),
          image_url: helpers.asset_url("logo-purple.png")
        }
      end

      @comment = Comment.new
      render "movies/show", status: :unprocessable_entity
    end
  end

  def update
    authorize @interest
    @interest.update(interest_params)
    @interests = policy_scope(Interest)
    @user = User.find(params[:id])
    @interests = Interest.includes(:user, :movie).where(user: @user)
    @unseen_interests = Interest.includes(:user, :movie).where(user: @user, seen: false)
    @seen_interests = Interest.includes(:user, :movie).where(user: @user, seen: true)
    @interests = Interest.includes(:movie, :user).where(user: @user)

    render partial: "interests/watchlist"
  end

  def destroy
    authorize @interest
    @interest.destroy
    if params[:source] == "movie"
      flash[:alert] = "#{@interest.movie.title} was removed from your Watchlist"
      redirect_to movie_path(@interest.movie), status: :see_other
    else
      flash[:alert] = "#{@interest.movie.title} was removed from your Watchlist"
      redirect_to user_interests_path(current_user), status: :see_other
    end
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
