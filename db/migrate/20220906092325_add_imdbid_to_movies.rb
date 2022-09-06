class AddImdbidToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :imdbid, :integer
  end
end
