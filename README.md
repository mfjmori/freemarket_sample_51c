
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|sring|null: false,|
|self_introduction|text||
|first_name|sring|null: false|
|last_name|sring|null: false|
|first_name_kana|sring|null: false|
|last_name_kana|sring|null: false|
|post_code|string|null: false|
|prefecture|sring|null: false|
|municipality|sring|null: false|
|house_number|string|null: false|
|phone_number|integer||
|building_name|string||
|point|integer|null: false,default: 0|
|sum_sales|integer|null: false, default: 0|
|card_numder|integer||
|limit_month|integer||
|limit_year|integer||
|security_code|integer||



### Association
- has_many :user_revews, dependent::destory
- has_many :likes, dependent::destory
- has_many :comments, dependent::destory
- has_many :items, dependent::destory
- has_many :messages
- has_many :buy_order
- has_one :profile


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|sring|null: false,|
|self_introduction|text||

### Association
- belongs_to :user


## buy_ordersテーブル

|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|receive_completed|boolearn|default: false,null: false|


### Association
- has_many :messages
- belongs_to :item
- belongs_to :saler, class_naem "User"
- belongs_to :buyer, class_naem "User"


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|descripton|text|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|brand|string||
|categories_id|references|null: false, foreign_key: true|
|size|string|null: false|
|condition|integer|null: false|
|price|integer|null: false|
|postage|integer|null: false|
|shipping_method|integer|null: false|
|region|string|null: false|
|shipping_date|integer|null: false|

### Association
- belongs_to :saler, class_naem "User"
- belongs_to :buyer, class_naem "User"
- belongs_to :categorie
- has_many :images, dependent::destory
- has_many :likes, dependent::destory
- has_many :comments, dependent::destory
- has_one :buy_order


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :item


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item



## user_reviewsテーブル

|Column|Type|Options|
|------|----|-------|

|rate|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|buy_order_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belong_to :buy_order
- belong_to :user



## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|references|null: false, foreign_key: true|

### Association
- has_many :items
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foregin_key::parent_id
