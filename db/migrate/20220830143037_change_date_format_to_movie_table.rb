class ChangeDateFormatToMovieTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :release_date, :date
    add_column :movies, :release_date, :integer
  end
end
