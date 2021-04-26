class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :tweet_link

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :image
    validates :title
    validates :info
    validates :category_id, numericality: { other_than: 1 } 
  end
end
