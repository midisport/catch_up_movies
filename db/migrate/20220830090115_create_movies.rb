class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :synopsis
      t.integer :duration
      t.string :poster
      t.string :original_language
      t.string :country
      t.string :genre
      t.date :release_date
      t.integer :imbd_rating

      t.timestamps
    end
  end
end
