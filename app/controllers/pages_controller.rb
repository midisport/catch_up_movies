class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    # Variables for follows
    @follows = policy_scope(Follow)
    @followers = Follow.where(followed: current_user)
    @followeds = Follow.where(follower: current_user)
    @follow = Follow.new

    # Variables for Watchlist
    @interests = policy_scope(Interest)
    @user = User.find(params[:id])
    @interests = Interest.where(user: @user)
    @interest_shows = movie_shows_for_movies_in_watchlist(@interests)
    # iterate over interests
    # detect movie from interest
    # find all the movie_shows of that movie
    # add them to array


    # Variables for Bookings
    @bookings = policy_scope(Booking)
    @bookings = Booking.where(user: @user)
  end

  private

  def movie_shows_for_movies_in_watchlist(interests)
    interest_shows = []
    interest_movies = interests.map(&:movie)
    MovieShow.all.each do |show|
      interest_shows << show if interest_movies.include?(show.movie)
    end
    return interest_shows
  end

end
