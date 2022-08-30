class Artist < ApplicationRecord
  has_many :castings
  has_many :movies, through: :castings
end
