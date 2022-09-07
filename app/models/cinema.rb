class Cinema < ApplicationRecord
  has_many :movie_shows, dependent: :destroy
  has_many :movies, through: :movie_shows

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  scope :next_days_shows, -> { joins(:movie_shows).where(movie_shows: { date: Date.today..5.days.from_now.to_date }) }
end
