class CommentsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.movie = @movie
    authorize @comment
    if @comment.save!
      redirect_to movie_path(@movie)
    else
      render 'movies/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
