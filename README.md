
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|sring|null: false, foreign_key: true|
|email|sring|null: false, foreign_key: true|
|password|sring|null: false, foreign_key: true|
|self_introduction|text||
|first_name|sring|null: false, foreign_key: true|
|last_name|sring|null: false, foreign_key: true|
|first_name_kana|sring|null: false, foreign_key: true|
|last_name_kana|sring|null: false, foreign_key: true|
|post_code|integer|null: false, foreign_key: true|
|prefecture|sring|null: false, foreign_key: true|
|municipality|sring|null: false, foreign_key: true|
|house_number|integer|null: false, foreign_key: true|
|phone_numb|integer|null: false, foreign_key: true|
|point|integer|null: false, foreign_key: true|
|sum_sales|integer|null: false, foreign_key: true|
|cord_numder|integer|null: false, foreign_key: true|
|limit_month|integer|null: false, foreign_key: true|
|limit_year|integer|null: false, foreign_key: true|
|security_code|integer|null: false, foreign_key: true|



### Association
- has_many :user_revews
- has_many :buy_orders
- has_many :likes
- has_many :comments
- has_many :items,through::buy_orders


## buy_ordersテーブル

|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|reserve|integer|null: false, foreign_key: true|


### Association
- belongs_to :users
- belongs_to :messages
<!--  -->
-  :items


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|
|descripton|text||
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|brand|string|null: false, foreign_key: true|
|categories_id|references|null: false, foreign_key: true|
|size|integer|null: false, foreign_key: true|
<!-- type -->
|condition||null: false, foreign_key: true|
|price|integer|null: false, foreign_key: true|
|postage|integer|null: false, foreign_key: true|
<!-- type -->
|shipping_method||null: false, foreign_key: true|
|region|string|null: false, foreign_key: true|
<!-- type -->
|shipping_date|string|null: false, foreign_key: true|

### Association
- belongs_to :comments
- belongs_to :likes
- has_many :immages
- has_many :categories
<!--  -->
-  :buy_orders
-  :users,through::users


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|text|text||

### Association
- belongs_to :users
- belongs_to :comments


## likesテーブル
<!-- true or false
 :boolean, default: false, null: false
-->
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :users
- belongs_to :items



## user_reviewsテーブル

|Column|Type|Options|
|------|----|-------|

|rate||foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user_revews


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|buy_order_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- has_many :buy_orders


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|integer| foreign_key: true|

### Association
- belongs_to :items


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|
|parent_id|references|null: false, foreign_key: true|

### Association
- belongs_to :items



