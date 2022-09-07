class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @movies = policy_scope(Movie).where(director: params[:query])
  end
end
