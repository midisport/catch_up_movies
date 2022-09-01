class InterestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @user = User.find(params[:user_id])
    @interests = Interest.where(user: @user)
    @follow = Follow.new
    @interests = policy_scope(Interest)
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @user = current_user

    @interest = Interest.new(movie: @movie, user: @user) # refactor this to use strog params

    authorize @interest

    if @interest.save
      redirect_to interests_path
    else
      render "movies/show", status: :unprocessable_entity
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    authorize @interest
    redirect_to interests_path, status: :see_other
  end
end
