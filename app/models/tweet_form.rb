class TweetForm
  include ActiveModel::Model
  attr_accessor :image, :title, :info, :category_id, :user_id, :link_one, :link_two, :link_three, :link_four

  with_options presence: true do
    validates :image
    validates :title
    validates :info
    validates :category_id, numericality: { other_than: 1 }
    validates :user_id
  end

  def save
    tweet = Tweet.create(image: image, title: title, info: info, category_id: category_id, user_id: user_id)
    TweetLink.create(link_one: link_one, link_two: link_two, link_three: link_three, link_four: link_four, tweet_id: tweet.id)
  end
end
