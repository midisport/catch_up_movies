class Interest < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :movie, dependent: :destroy

  validates :user, :movie, presence: true
  validates :movie, uniqueness: { scope: :user, message: "Ce film est déja dans votre Watchlist !" }
end
