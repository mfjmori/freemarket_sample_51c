# README
# DB設計
## usersテーブル
|Column|Type|Options|補足|
|----|------|----|-------|
|name|string|null: false, limit: 20|ニックネーム|
|email|string|null: false, unique: true|メール|
|password|string|null: false|パスワード|
|encrypted_password|string|null: false|再入力|
|first_name|string|null: false|姓|
|last_name|string|null: false|名|
|first_name_kana|string|null: false|カナ姓|
|last_name_kana|string|null: false|カナ名|
|postal_code|integer|null: false|郵便番号|
|prefecture|integer|null: false|都道府県|
|city|string|null: false|市区町村|
|address|string|null: false|番地|
|building|string||建物名|
|phone|string|null: false|電話番号|
|birthday|date|null: false|誕生日|
|money|integer|null: false, default :0|app内の金額|
|point|integer|null: false, default :0|appのpoint|
|seller_id|integer|null: false|出品者としてのid|
|buyer_id|integer|null: false|購入者としてのid|
|profile|text|limit: 1000|プロフィール情報|
|provider|string||SNS認証の種類|
|uid|string||SNS認証のid|
|payjp_id|string||PAYJP顧客ID|

### Association
- has_many :likes
- has_many :user_items
- has_many :items, through: :user_items
- belongs_to :card

## user_itemsテーブル (中間テーブル)

|Column|Type|Options|補足|
|------|----|-------|----|
|user_id|reference|null: false, foreign_key: true|外部キー|
|item_id|reference|null: false, foreign_key: true|外部キー|

### Association
- belongs_to :user
- belongs_to :item

## cardsテーブル
|Column|Type|Options|補足|
|------|----|-------|----|
|user_id|reference|null: false, foreign_key: true|usersの外部キー|
|customer_id|integer|null: false|gemで作られるid|
|card_id|integer|null: false|gemで作られるid|
### Assosiation
- belongs_to :user

## itemsテーブル
|Column|Type|Options|補足|
|------|----|-------|----|
|name|string|null: false, limit: 40, index: true|商品名|
|condition|integer|null: false|売出し中or売り切れ|
|delivery_cost|integer|null: false|送料込みor抜き(番号選択)|
|delivery_day|integer|null: false|配送日数(番号選択)|
|price|integer|null: false|価格|
|buyer_id|integer||enptyなら売れていない、presentであれば売れたとする|
|detail|text||商品説明文|
|delivery_prefecture|integer|null: false|発送元地域|
|delivery_method|integer|null: false|発送方法|
### Association
- has_many :likes
- has_many :user_items
- has_many :users, through: :user_items
- has_many :images
- belongs_to :category

## imagesテーブル
|Column|Type|Options|補足|
|------|----|-------|-----|
|item_id|reference|null: false, foreign_key: true|itemsの外部キー|
|image|string|null: false|画像(１枚)|
### Association
- belongs_to :item

## likesテーブル

|Column|Type|Options|補足|
|------|----|-------|----|
|item_id|integer|||
|buyer_id|integer|||

### Association
- belongs_to :user
- belongs_to :item

## categoriesテーブル (gem ancestryを使用)
|Column|Type|Options|補足|
|------|----|-------|----|
|name|string|null :false|カテゴリー名|
|ancestry|string||親子関係|

### Association
- has_many :items
- has_ancestry
