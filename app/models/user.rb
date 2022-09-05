class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :interests, dependent: :destroy
  has_many :movies, through: :interests
  has_many :bookings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followers, class_name: "Follow", foreign_key: :followed_id, dependent: :destroy
  has_many :followeds, class_name: "Follow", foreign_key: :follower_id, dependent: :destroy

  validates :password, :email, :username, presence: true
  validates :email, format: { with: /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/ }
  validates :email, :username, uniqueness: true
end
