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
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,|
|password|string|null: false|
|email|string|null: false, unique: true, index: true|

### Association
has_many :seller_items, foreign_key: "seller_id", class_name: "items"
has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
has_one :credit_card, dependent: :destroy

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association 
belongs_to:user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|references|foreign_key: true|
|item_condition|references|null: false,foreign_key: true|
|postage_payer|references|null: false,foreign_key: true|
|prefecture_code|integer|null: false|
|size|references|null: false, foreign_key: true|
|preparation_day|references|null: false, foreign_key: true|
|postage_type|references|null: false, foreign_key: true|
|item_img|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|trading_status|enum|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|deal_closed_date|timestamp|

### Association
has_many :comments, dependent: :destroy
has_many :favorites
has_many :item_imgs, dependent: :destroy
has_one :user_evaluation
belongs_to :category
belongs_to_active_hash :size
belongs_to_active_hash :item_condition
belongs_to_active_hash :postage_payer
belongs_to_active_hash :preparation_day
belongs_to_active_hash :postage_type
belongs_to :brand
belongs_to :seller, class_name: "User"
belongs_to :buyer, class_name: "User"
