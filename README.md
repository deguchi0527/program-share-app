# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| -------------------| ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| profile            | text   | null: false               |

### Association

- has_many :tweets
- has_many :memos
- has_many :comments
- has_many :likes


## tweets テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| title                  | string     | null: false                    |
| info                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- has_many   :likes
- has_one    :tweet_link
- belongs_to :user


## comments テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| text                   | text       | null: false                    |
| user                   | references | null: false, foreign_key: true |
| tweet                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet


## memos テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| title                  | string     | null: false                    |
| info                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- has_one    :memo_link
- belongs_to :user


## tweet_linksテーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| link_one           | text       |                                |
| link_two           | text       |                                |
| link_three         | text       |                                |
| link_four          | text       |                                |
| tweet              | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet


## tweet_linksテーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| link_one           | text       |                                |
| link_two           | text       |                                |
| link_three         | text       |                                |
| link_four          | text       |                                |
| memo               | references | null: false, foreign_key: true |

### Association

- belongs_to :memo


## likes テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| tweet                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet