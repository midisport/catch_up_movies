class FollowsController < ApplicationController
  def index
    @follows = policy_scope(Follow)
    @followers = Follow.where(followed: current_user)
    @followeds = Follow.where(follower: current_user)
  end

  def create
    @follow = Follow.new
    @follow.follower = current_user
    followed = User.find(follow_params[:followed_id])
    @follow.followed = followed

    if @follow.save
      redirect_to user_interests_path(followed)
    else
      # make this a render and use ajax, so errors are actually displayed ? (Need to ask if there's a better way)
      @user = User.find(followed.id)
      @interests = Interest.where(user: @user)
      raise
      render "interests/index", status: :unprocessable_entity
    end
    authorize @follow
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
