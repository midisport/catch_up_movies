class CreateMovieShows < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_shows do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :cinema, null: false, foreign_key: true
      t.time :start_at
      t.string :language
      t.string :subtitle

      t.timestamps
    end
  end
end
