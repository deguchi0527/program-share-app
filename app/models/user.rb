class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :comments
  has_many :likes

  validates :nickname, presence: true
  validates :profile,  presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end
end
