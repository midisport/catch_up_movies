class RenameImbd < ActiveRecord::Migration[7.0]
  def change
    rename_column( :movies, :imbd_rating, :imdb_rating)
  end
end
