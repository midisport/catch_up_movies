class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower, uniqueness: { scope: :followed, message: "Vous suivez déja cette personne" }
end
