class CommentsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.movie = @movie
    authorize @comment
    respond_to do |format|
      if @comment.save
        format.html { redirect_to movie_path(@movie) }
        format.json
      else
        format.html { render 'movies/show', status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
