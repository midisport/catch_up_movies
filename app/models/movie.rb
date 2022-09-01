class Movie < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :movie_shows, dependent: :destroy
  has_many :castings, dependent: :destroy
  has_many :artists, through: :castings

  include PgSearch::Model
  pg_search_scope :search_movie,
  against: [:title],
  associated_against: {
    artist: [:first_name, :last_name]
  },
  using: {
    tsearch: { prefix: true }
  }
end
