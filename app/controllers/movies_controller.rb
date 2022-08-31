class MoviesController < ApplicationController

  def index
    if params[:query].present?
      @movies = Movie.where(title: params[:query])
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @directors = @movie.artists
    @actors = @movie.artists
    @comment = Comment.new
    @interest = Interest.new
  end
end
