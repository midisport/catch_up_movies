class Movie < ApplicationRecord
  has_many :comments
  has_many :interests
  has_many :movie_shows
  has_many :castings
  has_many :artists, through: :castings
end
