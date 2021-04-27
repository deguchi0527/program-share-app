class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :tweet_link

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
