class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie_show

  validates :user, uniqueness: { scope: :movie_show }
end
