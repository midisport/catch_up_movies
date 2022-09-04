class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  # Prevent a user following the same user twice
  validates :follower, uniqueness: { scope: :followed, message: "Vous suivez déja cette personne" }

  # Method to be called on a user's follower to check if current_user is following them back
  def followed?(current_user)
    current_user.followeds.exists?(followed_id: follower.id)
  end

  # returns an array of movies which both follower and followed have in their watchlist
  def shared_films
    follower_films = follower.interests.includes(:movie).map { |interest| interest.movie }
    followed_films = followed.interests.includes(:movie).map { |interest| interest.movie }
    shared_films = follower_films.select { |film| followed_films.include?(film) }
    return shared_films
  end
end
