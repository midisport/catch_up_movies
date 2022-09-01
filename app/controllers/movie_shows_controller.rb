class MovieShowsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:show]
  def index
    @movie_shows = policy_scope(MovieShow)
  end
end
