class RemoveTypeColumnFromCinemas < ActiveRecord::Migration[7.0]
  def change
    remove_column :cinemas, :type, :string
  end
end
