class InterestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @interests = policy_scope(Interest)

    @user = User.find(params[:user_id])
    @interests = Interest.where(user: @user)
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
      @directors = @movie.artists
      @actors = @movie.artists
      @comment = Comment.new

      render "movies/show", status: :unprocessable_entity
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    authorize @interest
    redirect_to user_interests_path(current_user), status: :see_other
  end
end
