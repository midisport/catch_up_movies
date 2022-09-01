class CinemasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @cinema = Cinema.find(params[:id])
    authorize @cinema
  end
end
