FactoryBot.define do
  factory :tweet do
    title { 'Rubyについて' }
    info { 'Rubyのif文について勉強した。if文を使うことで条件分岐できる。' }
    category_id { 2 }
    link_one { 'http://localhost:3000/' }
    link_two { 'http://localhost:3000/' }
    link_three { 'http://localhost:3000/' }
    link_four { 'http://localhost:3000/' }
    association :user

    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
