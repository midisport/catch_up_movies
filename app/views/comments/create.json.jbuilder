if @comment.persisted?
  json.form render(partial: "comments/form_com", formats: :html, locals: {movie: @movie, comment: Comment.new})
  json.inserted_item render(partial: "movies/comment", formats: :html, locals: {comment: @comment})
else
  json.form render(partial: "comments/form_com", formats: :html, locals: {movie: @movie, comment: @comment})
end
