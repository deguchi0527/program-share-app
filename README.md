# アプリ名

## program-share-app

# 概要

### プログラミングの知識を共有するアプリ。<br>また、投稿を非公開にし自分だけが閲覧できる備忘録としても利用できる。

# 本番環境

### https://program-share-app.herokuapp.com/
<br>

### Basic認証のIDとパスワード

- ID:&ensp;test
- パスワード:&ensp;0000

### ログイン情報（テスト用）

- Eメール:&ensp;test@test.com
- パスワード:&ensp;test00

# 利用方法

# 工夫したポイント
- コメント機能を非同期で行えるようにした(ActionStorageを用いて実装した)。
- Bootstrapとメディアクエリを使用してレスポンシブ対応した(PCやタブレットだとサイドバーが表示される等)。
- JQueryを使用し、画像が複数枚投稿された場合、詳細ページでスライド切り替えできるようにした。

# 使用技術(開発環境)

## バックエンド
- Ruby, Ruby on Rails

## フロントエンド
- HTML, CSS, JQuery, Bootstrap, FontAwesome

## データベース
- MySQL
## インフラ
- Heroku
## ソース管理
- GitHub, GitHubDesktop
## テスト
- RSpec
## エディタ
- VSCode

# 課題や今度実装したい機能
- よく閲覧するUserの投稿が優先して見れるようにフォロー機能をつける。
- いいねした投稿をまとめる画面を作成する。
- アプリの見た目をモダンなものとし、見栄えを良くする。

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
- has_many :comments
- has_many :likes


## tweets テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| title                  | string     | null: false                    |
| info                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| private_id             | integer    | null: false                    |
| link_one               | text       |                                |
| link_two               | text       |                                |
| link_three             | text       |                                |
| link_four              | text       |                                |
| user                   | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- has_many   :likes
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


## likes テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| tweet                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet