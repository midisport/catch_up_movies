class AddCoordinatesToCinemas < ActiveRecord::Migration[7.0]
  def change
    add_column :cinemas, :latitude, :float
    add_column :cinemas, :longitude, :float
  end
end
