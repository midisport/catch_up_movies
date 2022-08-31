class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :interests
  has_many :bookings
  has_many :comments

  has_many :followers, class_name: "Follow", foreign_key: :followed_id, dependent: :destroy
  has_many :followeds, class_name: "Follow", foreign_key: :follower_id, dependent: :destroy
end
