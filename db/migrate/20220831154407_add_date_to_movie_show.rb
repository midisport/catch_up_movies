class AddDateToMovieShow < ActiveRecord::Migration[7.0]
  def change
    add_column :movie_shows, :date, :date
  end
end
