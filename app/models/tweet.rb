class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :tweet_link, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
