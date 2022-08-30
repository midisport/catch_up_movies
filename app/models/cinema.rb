class Cinema < ApplicationRecord
  has_many :movie_shows
  has_many :movies, through: :movie_shows
end
