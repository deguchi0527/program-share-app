# アプリ名

### program-share-app

# 概要

### プログラミングの知識を共有するアプリ。<br>また、投稿を非公開にし自分だけが閲覧できる備忘録としても利用できる。

# 本番環境
※ 就職活動中の為、Basic認証を外しています。

### http://18.178.33.101/
<br>

### ログイン情報（テスト用）

- Eメール:&ensp;test@test.com
- パスワード:&ensp;test00

# 制作背景(意図)
エンジニアやプログラミング学習者が知識を共有するコミュニケーションアプリ。<br>画像や参考記事を貼り投稿し、互いに知識を向上させる。<br>コメントでその投稿に対して質問する事ができる。<br>また、投稿を非公開にすることで自分だけが確認できるメモ機能により、手軽に知識のアウトプット、記録を残す事ができる。

# DEMO
### トップページ
[![Image from Gyazo](https://i.gyazo.com/b6f980d7246dce6293e12562fab64c5a.jpg)](https://gyazo.com/b6f980d7246dce6293e12562fab64c5a)

- トップページには投稿一覧が表示される。
- タブレット端末以上の画面で閲覧するとサイドバーが表示される。サイドバーにはUser名、人気(いいね数が多い)投稿等が表示される。
- ログインしているUserは投稿するをクリックすると投稿ページに遷移する。
- headerのフォームからカテゴリー検索/投稿名検索をする事ができる



# 利用方法
- **ユーザー管理機能** : 投稿やコメント、いいねをする為に新規登録をおこなう(閲覧のみなら登録不要)。
- **投稿機能** : ログインしたUserは投稿ページに遷移する事ができる。投稿ページで新規投稿をおこなう。投稿を非公開にすることで自分しか投稿を閲覧することができない。投稿者は投稿を編集、削除する事ができる。
- **コメント機能** : ログインしたUserは投稿に対してコメントする事ができる。コメントは非同期通信でおこなえる。
- **検索機能** : headerの検索フォームからカテゴリー検索と投稿タイトル検索をすることができる。
- **マイページ** : Userの投稿一覧を閲覧する事ができる。アカウント編集ページやメモ(自身の非公開投稿)ページに遷移する事ができる。
- **いいね機能** : ログインしたUserは投稿にいいねをする事ができる。

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
- AWS(EC2),Capistrano
## Webサーバー
- nginx
## アプリケーションサーバー
- unicorn
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