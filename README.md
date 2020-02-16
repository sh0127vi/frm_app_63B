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
|birthday|integer|null: false|
|phone_number|integer|null: false|

### Association
- has_many :products
- has_one :address
- has_one :credit_card

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|name|string|null: false|
|detail|text|null: false|
|category_id|integer|null: false|
|price|integer|null: false|
|status|integer|null: false|
|city|references|null: false|
|delivery|integer|null: false|
|fee_payer|integer|null: false|
|delivery_area|integer|null: false|

### Association
- belongs_to user
- has_many :images
- has_many :categorise

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false,foreign_key:true|
|image|string|null: false|

### Association
- belongs to product

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|f_name_kana|string|null: false|
|l_name_kana|string|null: false|
|f_name|string|null: false|
|l_name|string|null: false|
|postal_code|integer||
|prefecture|integer||
|city|string||
|street|string||
|building|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs to user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|numbar|integer|null: false|
|year|integer|null: false|
|month|integer|null: false|
|CVC|integer|null: false|

### Association
- belongs to user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|product_id|integer|null: false|

### Association
- belongs to user
- belongs to product

## categoriseテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false|
|name|string|null: false|

### Association
- has_many :products
- has_ancestry