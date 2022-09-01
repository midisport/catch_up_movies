class MovieShow < ApplicationRecord
  belongs_to :movie
  belongs_to :cinema

  has_many :bookings
end
