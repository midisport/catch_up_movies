class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @follows = policy_scope(Follow)
    @followers = Follow.where(followed: current_user)
    @followeds = Follow.where(follower: current_user)
  end
end
