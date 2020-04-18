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

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|f_name_kana|string|null: false|
|l_name_kana|string|null: false|
|f_name|string|null: false|
|l_name|string|null: false|
|birthday|date|null: false|

### Association
- has_one :address, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :address
- accepts_nested_attributes_for :address
- has_many :products
- has_many :purchases, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :like_products, through: :likes, source: :product 
- has_many :comments

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false foreign_key: true|
|name|string|null: false|
|detail|text|null: false|
|category_id|references|null: false,foreign_key: true|
|price|integer|null: false|
|condition|string|null: false|
|city|string|null: false|
|delivery|string|null: false|
|fee_payer|string|null: false|
|likes_count|integer||
|brand_id|references|foreign_key: true|

### Association
- belongs_to :user
- has_many :images, dependent: :destroy
- belongs_to :category
- belongs_tp :brand
- has_many :likes, dependent: :destroy
- has_many :likes_users, through: :user, source: :user
- has_one :purchase
- has_many :comments

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false,foreign_key:true|
|image|string|null: false|

### Association
- belongs_to :product

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|f_name_kana|string|null: false|
|l_name_kana|string|null: false|
|f_name|string|null: false|
|l_name|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string||
|phone_number|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|product_id|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :products
- has_ancestry

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|references|null: false|
|product_id|references|null: false|

### Association
- belongs_to :user
- belongs_to :product

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|body|text|null: false|

### Association
- belongs_to :user
- belongs_to :product

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products