# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
|name|string|null: false|
|name_alias|string|null: false|
|nickname|string|null: false|
|email|string|null: false|
|birthday|date|null: false|
### Association
- has_many :exhibitions
- has_many :purchases
- has_many :comments
- belongs_to :addresses

## exhibitionsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
|item|string|null: false|
|image|string|null: false|
|price|integer|null: false|
|about|text|null: false|
|category|string|null: false|
|condition|string|null: false|
|delivery_fee|string|null: false|
|from|string|null: false|
|days|string|null: false|
### Association
- has_many :comments
- belongs_to :users
- belongs_to :purchases
- belongs_to :addresses

## purchasesテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
|user|references|null: false, foreign_key: true|
|exhibition|references|null: false, foreign_key: true|
### Association
- has_many :comments
- belongs_to :users
- belongs_to :exhibitions
- belongs_to :addresses

## addressesテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building|string|
|tel|integer|null: false|
### Association
- has_many :comments
- belongs_to :users
- belongs_to :exhibitions
- belongs_to :purchases

## commentsテーブル
| Column | Type | Options |
| ------ | ---- | ------- |
|user|references|null: false, foreign_key: true|
|exhibition|references|null: false, foreign_key: true|
|content|text|null: false|
### Association
- belongs_to :users
- belongs_to :exhibitions
- belongs_to :purchases
- belongs_to :addresses
