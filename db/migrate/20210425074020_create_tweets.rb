class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string  :title,       null: false
      t.text    :info,        null: false
      t.integer :category_id, null: false
      t.integer :private_id,  null: false
      t.text    :link_one
      t.text    :link_two
      t.text    :link_three
      t.text    :link_four
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
