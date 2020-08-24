[![CircleCI](https://circleci.com/gh/deutzia186/money_book.svg?style=svg)](https://circleci.com/gh/deutzia186/money_book)

# Money Book
Ruby on Railsを用いた家計簿アプリケーション

## イメージ
![moneybook](https://user-images.githubusercontent.com/59218383/91020550-8c4d1480-e62d-11ea-8852-64e909129503.jpg)

## リンク
http://54.178.112.22/

ユーザー登録なしでも利用できるようにゲストログイン機能を実装しております。

## 環境
* ruby 2.5.1
* Ruby on Rails 6.0.3.1
* MySQL 5.6.47
* Haml,SCSS
* JavaScript
* Github
* Rspec
* Docker
* AWS(EC2,S3)
* Capistrano
* CircleCI


## 実装されてる機能
* ユーザー登録、ログイン(devise)
* ゲストログイン
* 家計簿作成、編集、削除
* 画像アップロード(carrierwave)
* 検索（ransack）
* ページネーション（kaminari）
* ブックマーク
* 当月収支の表示
* 当月収支の内訳をグラフ化
* 直近の明細5件の表示
* 収支のカレンダー表示
* Rspecを使ったテスト
* CircleCIによるテスト,デプロイの自動化