class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user, :movie, presence: true
  validates :movie, uniqueness: { scope: :user, message: "Ce film est déja dans votre Watchlist !" }
end
