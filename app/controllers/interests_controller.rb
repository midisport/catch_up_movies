class InterestsController < ApplicationController

  def index
    @user = current_user
    @interests = Interest.where(user: @user)
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @user = current_user
    @interest = Interest.new(movie: @movie, user: @user)
    @interest.save
    redirect_to interests_path
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    redirect_to interests_path, status: :see_other
  end
end
