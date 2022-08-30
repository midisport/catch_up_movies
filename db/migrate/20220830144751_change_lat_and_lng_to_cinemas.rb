class ChangeLatAndLngToCinemas < ActiveRecord::Migration[7.0]
  def change
    remove_column :cinemas, :lat, :decimal
    remove_column :cinemas, :lng, :decimal
    add_column :cinemas, :lat, :float
    add_column :cinemas, :lng, :float
  end
end
