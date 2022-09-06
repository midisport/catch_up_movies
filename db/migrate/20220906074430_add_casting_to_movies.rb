class AddCastingToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :director, :string
    add_column :movies, :actors, :string
  end
end
