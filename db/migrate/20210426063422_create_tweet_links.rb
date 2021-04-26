class CreateTweetLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_links do |t|
      t.text :link_one
      t.text :link_two
      t.text :link_three
      t.text :link_four
      t.references :tweet, foreign_key: true
      t.timestamps
    end
  end
end
