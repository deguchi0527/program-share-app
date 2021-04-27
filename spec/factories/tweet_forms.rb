FactoryBot.define do
  factory :tweet_form do
    image {'test_image.png'}
    title { 'Rubyについて' }
    info { 'Rubyのif文について勉強した。if文を使うことで条件分岐できる。' }
    category_id { 2 }
    link_one { 'http://localhost:3000/' }
    link_two { 'http://localhost:3000/' }
    link_three { 'http://localhost:3000/' }
    link_four { 'http://localhost:3000/' }
  end
end
