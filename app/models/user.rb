class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :tweets
  has_many :favorites, dependent: :destroy
  has_many :favorite_tweets, through: :favorites, source: :tweet
  mount_uploader :icon, IconUploader
end
