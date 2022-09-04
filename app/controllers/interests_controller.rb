class InterestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @interests = policy_scope(Interest)

    @user = User.find(params[:user_id])
    @interests = Interest.includes(:user, :movie).where(user: @user)
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
end
