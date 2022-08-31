class FollowsController < ApplicationController
  def index
    @followers = Follow.where(followed: current_user) # follower_id = current_user
    @followeds = Follow.where(follower: current_user) # follower_id = current_user
  end

  def create
    
  end
end
