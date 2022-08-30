class Movie < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :movie_shows, dependent: :destroy
  has_many :castings, dependent: :destroy
  has_many :artists, through: :castings
end
