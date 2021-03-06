class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :image_two
  has_one_attached :image_three
  has_one_attached :image_four
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :private

  with_options presence: true do
    validates :image
    validates :title
    validates :info
    validates :category_id, numericality: { other_than: 1 }
    validates :private_id,  numericality: { other_than: 1 }
  end
end
