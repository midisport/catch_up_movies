class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    # Variables for follows
    @follows = policy_scope(Follow)
    @followers = Follow.where(followed: current_user)
    @followeds = Follow.includes(:followed).where(follower: current_user)
    @follow = Follow.new

    # Variables for Watchlist
    @interests = policy_scope(Interest)
    @user = User.find(params[:id])
    @interests = Interest.includes(:movie, :user).where(user: @user)

    # Variables for Bookings
    @bookings = policy_scope(Booking)
    @bookings = Booking.includes(:movie_show).where(user: @user)
  end
end
