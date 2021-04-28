class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'HTML&CSS' },
    { id: 3, name: 'JavaScript' },
    { id: 4, name: 'jQuery' },
    { id: 5, name: 'Ruby' },
    { id: 6, name: 'Ruby on Rails' },
    { id: 7, name: 'PHP' },
    { id: 8, name: 'Java' },
    { id: 9, name: 'Python' },
    { id: 10, name: 'Git' },
    { id: 11, name: 'Sass' },
    { id: 12, name: 'Command Line' },
    { id: 13, name: '環境構築' },
    { id: 14, name: 'エラー関連' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
