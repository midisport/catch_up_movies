class Cinema < ApplicationRecord
  has_many :movie_shows, dependent: :destroy
  has_many :movies, through: :movie_shows
end
