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
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|password|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|

### Association
has_one :profile, dependent: :destroy
has_one :creditcard, dependent: :destroy
has_many :products, dependent: :destroy
has_many :buyer_trades, dependent: :destroy, class_name: "Trade", foreign_key: "buyer_id"
has_many :seller_trades, dependent: :destroy, class_name: "Trade", foreign_key: "seller_id"

## Profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true, null: false|
|avatar|string|
|birthyear|integer|null: false|
|birthmonth|integer|null: false|
|birthday|integer|null: false|
|family_name|string|null: false|
|personal_name|string|null: false|
|family_name_kana|string|null: false|
|personal_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|
|tel|integer|
|post_family_name|string|null: false|
|post_personal_name|string|null: false|
|post_family_name_kana|string|null: false|
|post_personal_name_kana|string|null: false|

### Association 
 belongs_to:user


## Creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|card_id|string|null: false|
|customer_id|string|null: false|

### Association 
belongs_to:user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|fresh_status|integer|null:false|
|user_id|references|foreign_key: true|
|sell_status|string|null: false|
|price|integer|null: false|
|deliver_person|string|null: false|
|from_area|string|null: false|
|deliver_leadtime|string|null: false|
|deliver_way|string|null: false|
|brand_id|references|foreign_key: true|
|category_index_id|references|foreign_key: true|
|bigcategory_id|references|foreign_key: true|
|smallcategory_id|references|foreign_key: true|
|size_id|references|foreign_key: true|

### Association
has_one :trade
has_many :product_images, dependent: :delete_all
belongs_to :user
belongs_to :brand
has_one :category_index
has_one :bigcategory
has_one :smallcategory
has_one :size

## ProductImagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|foreign_key: true|

### Association
belongs_to :product, optional:true

## Sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
belongs_to :product
has_many :smallcategories
has_many :smallcategories_has_sizes

## Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
belongs_to :size
belongs_to :items

## Tradesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key: true|
|buyer_id|references|foreign_key: { to_table: :users }, null: false|
|seller_id|references|foreign_key: { to_table: :users }, null: false|

### Association
belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
belongs_to :seller, class_name: "User", foreign_key: "seller_id"
belongs_to :product