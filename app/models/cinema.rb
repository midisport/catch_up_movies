class Cinema < ApplicationRecord
  has_many :movie_shows, dependent: :destroy
  has_many :movies, through: :movie_shows

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
