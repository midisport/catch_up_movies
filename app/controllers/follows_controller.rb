class FollowsController < ApplicationController
  def index
    @followers = Follow.where(followed: current_user)
    @followeds = Follow.where(follower: current_user)
  end

  def create
    @follow = Follow.new()
    @follow.follower = current_user
    followed = User.find(params[:follow][:followed_id])
    @follow.followed = followed

    if @follow.save
      redirect_to user_interests_path(followed)
    else
      render "follows/form", status: :unprocessable_entity # this doesn't work - rails can't find the template
    end
  end

  private

  def follow_params
    params.require(:follow).permit(:followed_id)
  end
end
