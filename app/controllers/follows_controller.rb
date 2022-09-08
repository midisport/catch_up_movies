class FollowsController < ApplicationController
  def index
    @follows = policy_scope(Follow)
    @followers = Follow.where(followed: :user_id)
    @followeds = Follow.where(follower: :user_id)
    # raise
  end

  def create
    @follow = Follow.new
    @follow.follower = current_user
    followed = User.find(follow_params[:followed_id])
    @follow.followed = followed
    authorize @follow

    if @follow.save
      @unseen_interests = Interest.includes(:user, :movie).where(user: @user, seen: false)
      @seen_interests = Interest.includes(:user, :movie).where(user: @user, seen: true)
      @unseen_interests = Interest.includes(:user, :movie).where(user: @user, seen: false)
      @seen_interests = Interest.includes(:user, :movie).where(user: @user, seen: true)
      params[:user_id].present? ? @user = User.find(params[:user_id]) : @user = current_user
      flash[:notice] = "You followed #{@follow.followed.username}"
      redirect_to user_interests_path(followed)
    else
      # make this a render and use ajax, so errors are actually displayed ? (Need to ask if there's a better way)
      @unseen_interests = Interest.includes(:user, :movie).where(user: @user, seen: false)
      @seen_interests = Interest.includes(:user, :movie).where(user: @user, seen: true)
      @user = User.find(followed.id)
      @interests = Interest.where(user: @user)
      render "interests/index", status: :unprocessable_entity
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy

    redirect_to follows_path
    authorize @follow
  end

  private

  def follow_params
    params.require(:follow).permit(:followed_id)
  end
end
