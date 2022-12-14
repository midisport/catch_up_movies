class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    # Variables for follows
    @follows = policy_scope(Follow)
    @followers = Follow.includes(:followed, :follower).where(followed: params[:id])
    @followeds = Follow.includes(:followed, :follower).where(follower: params[:id])
    @follow = Follow.new

    # Variables for Watchlist
    @interests = policy_scope(Interest)
    @user = User.find(params[:id])
    @interests = Interest.includes(:user, :movie).where(user: @user)
    @unseen_interests = Interest.includes(:user, :movie).where(user: @user, seen: false)
    @seen_interests = Interest.includes(:user, :movie).where(user: @user, seen: true)

    # Variables for Bookings
    @bookings = policy_scope(Booking)
    @bookings = Booking.includes(:user, movie_show: [:movie, :cinema]).where(user: @user).order("movie_shows.date, movie_shows.start_at")
    @bookings_today = @bookings.select { |booking| booking.movie_show.date == Date.today }
    @bookings_upcoming = @bookings.select { |booking| booking.movie_show.date > Date.today }
    @bookings_past = @bookings.select { |booking| booking.movie_show.date < Date.today }
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
