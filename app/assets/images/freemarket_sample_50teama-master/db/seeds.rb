# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.upto(11) do |num|
  User.create(
    name: "user#{num}",
    email: "user#{num}@gmail.com",
    password: "11111111",
    first_name: "寧夢#{num}",
    last_name: "遊座#{num}",
    first_name_kana: "ネイム",
    last_name_kana: "ユウザ",
    postal_code: 1000000 + num,
    prefecture: rand(1..47),
    city:"保外市#{num}",
    building: "富嶽ビル#{num}",
    address:"#{num}",
    phone: 9000000000 + num + num * 10000,
    birthday: '2000-01-01',
    money: 50000 + num * 1000,
    point: 3000 + num * 100,
    seller_id: num,
    buyer_id: num,
    profile: "user#{num}です、よろしく！",
    payjp_id: "cus_8f1bf365e98a8c5a6ce7f313e3c3"
    )
  # TODO: エラーは出ないが作成できない 現状テーブルに外部キー設定なし影響？？ パンケーキ手焼きは可能
  # 同一ユーザーによるダブりデータができない方法をとる（ダブるとどうなるか不明）
  if num % 2 == 0
    Like.create(buyer_id: num, item_id: (num + 11) % 60)
    Like.create(buyer_id: num, item_id: (num + 21) % 60)
    Like.create(buyer_id: num, item_id: (num + 31) % 60)
    Like.create(buyer_id: num, item_id: (num + 41) % 60)
    Like.create(buyer_id: num, item_id: (num + 51) % 60)
    if num % 3 == 1
      Like.create(buyer_id: num, item_id: (num + 15) % 60)
      Like.create(buyer_id: num, item_id: (num + 35) % 60)
    elsif num % 3 == 2
      Like.create(buyer_id: num, item_id: (num + 45) % 60)
    else
      Like.create(buyer_id: num, item_id: (num + 5) % 60)
      Like.create(buyer_id: num, item_id: (num + 25) % 60)
      Like.create(buyer_id: num, item_id: (num + 55) % 60)
    end
  else
    Like.create(buyer_id: num, item_id: (num * num + 10) % 60)
    Like.create(buyer_id: num, item_id: (num * num + 30) % 60)
    Like.create(buyer_id: num, item_id: (num * num + 50) % 60)
    if num % 5 == 0
      Like.create(buyer_id: num, item_id: (num * num + 20) % 60)
      Like.create(buyer_id: num, item_id: (num * num + 40) % 60)
    end
    if num % 7 == 0
      Like.create(buyer_id: num, item_id: (num * num + 0) % 60)
    end
  end
end

1.upto(33) do |num|
  Item.create(
    name: "お買い得セット#{num}",
    condition: rand(1..6),
    delivery_cost: rand(1..2),
    delivery_day: rand(1..3),
    price: num * 1000,
    detail: "この文章は商品説明用です！この商品のIDは#{num}です！yay!",
    delivery_prefecture: rand(1..48),
    delivery_method: rand(1..9),
    status: rand(0..2),
    category_id: rand(1..10)
    )
end

1.upto(33) do |num|
  UserItem.create(user_id: num, item_id: num * 3 - 2)
  UserItem.create(user_id: num, item_id: num * 3 - 1)
  UserItem.create(user_id: num, item_id: num * 3 - 0)
end

1.upto(33) do |num|
  1.upto(10) do |n|
    image_path = "#{Rails.root}/app/uploaders/dummy_images/m#{num}_#{n}.jpg"
    Image.create(item_id: num,image: open(image_path)) if File.exist?(image_path)
  end
end

ladies = Category.create(name: "レディース")
mens = Category.create(name: "メンズ")
kids = Category.create(name: "ベビー・キッズ")
interior = Category.create(name: "インテリア・住まい・小物")
hobby = Category.create(name: "本・音楽・ゲーム")
goods = Category.create(name: "おもちゃ・ホビー・グッズ")
cosmetic = Category.create(name: "コスメ・香水・美容")
appliance = Category.create(name: "家電・スマホ・カメラ")
sport = Category.create(name: "スポーツ・レジャー")
handmade = Category.create(name: "ハンドメイド")
ticket = Category.create(name: "チケット")
bicycle = Category.create(name: "自動車・オートバイ")
another = Category.create(name: "その他")

w_tops = ladies.children.create(name: "トップス")
w_jacket = ladies.children.create(name: "ジャケット/アウター")
w_pants = ladies.children.create(name: "パンツ")
w_skirt = ladies.children.create(name: "スカート")
w_onepiece = ladies.children.create(name: "ワンピース")
w_shoes = ladies.children.create(name: "靴")
w_roomwear = ladies.children.create(name: "ルームウェア/パジャマ")
w_regwear = ladies.children.create(name: "レッグウェア")
w_hat = ladies.children.create(name: "帽子")
w_bag = ladies.children.create(name: "バッグ")
w_accessorie = ladies.children.create(name: "アクセサリー")
w_hearaccessorie = ladies.children.create(name: "ヘアアクセサリー")
w_smallarticle = ladies.children.create(name: "小物")
w_clock = ladies.children.create(name: "時計")

m_tops = mens.children.create(name: "トップス")
m_jacket = mens.children.create(name: "ジャケット/アウター")
m_pants = mens.children.create(name: "パンツ")
m_shoes = mens.children.create(name: "靴")
m_bag = mens.children.create(name: "バッグ")
m_suit = mens.children.create(name: "スーツ")
m_hat = mens.children.create(name: "帽子")
m_accessorie = mens.children.create(name: "アクセサリー")
m_smallarticle = mens.children.create(name: "小物")
m_clock = mens.children.create(name: "時計")
m_swimwear = mens.children.create(name: "水着")
m_regwear = mens.children.create(name: "レッグウェア")
m_underwear = mens.children.create(name: "アンダーウェア")
m_another = mens.children.create(name: "その他")

kids_girl_under_95 = kids.children.create(name:"ベビー服(女の子用)~95cm")
kids_boy_under_95 = kids.children.create(name:"ベビー服(男の子用)~95cm")
kids_girl_and_boy_under_95 = kids.children.create(name:"ベビー服(男女兼用)~95cm")
kids_girl_over_100 = kids.children.create(name:"キッズ服(女の子用)100cm~")
kids_boy_over_100 = kids.children.create(name:"キッズ服(男の子用)100cm~")
kids_girl_and_boy_over_100 = kids.children.create(name:"キッズ服(男女兼用)100cm~")
kids_shoes = kids.children.create(name:"キッズ靴")
kids_small = kids.children.create(name:"子供用ファッション小物")
kids_bath = kids.children.create(name:"おむつ/トイレ/バス")
kids_out = kids.children.create(name:"外出/移動用品")
kids_meal = kids.children.create(name:"搾乳/食事")
kids_furniture = kids.children.create(name:"ベビー家具/寝具/室内用品")
kids_toy = kids.children.create(name:"おもちゃ")
kids_souvenir = kids.children.create(name:"行事/記念品")

interior_kitchen = interior.children.create(name:"キッチン/食器")
interior_mat = interior.children.create(name:"ベッド/マットレス")
interior_sofa = interior.children.create(name:"ソファ/ソファベッド")
interior_chair = interior.children.create(name:"椅子/チェア")
interior_desk = interior.children.create(name:"机/テーブル")
interior_storage = interior.children.create(name:"収納家具")
interior_rag = interior.children.create(name:"ラグ/カーペット/マット")
interior_karten = interior.children.create(name:"カーテン/ブラインド")
interior_light = interior.children.create(name:"ライト/照明")

hobby_book = hobby.children.create(name:"本")
hobby_comic = hobby.children.create(name:"漫画")
hobby_magazine = hobby.children.create(name:"雑誌")

goods_toy = goods.children.create(name:"おもちゃ")
goods_tarent = goods.children.create(name:"タレントグッズ")
goods_anime = goods.children.create(name:"コミック/アニメグッズ")

cosmetic_base = cosmetic.children.create(name:"ベースメイク")
cosmetic_make = cosmetic.children.create(name:"メイクアップ")
cosmetic_nail = cosmetic.children.create(name:"ネイルケア")

appliance_phone = appliance.children.create(name:"スマートフォン/携帯電話")
appliance_accessorie = appliance.children.create(name:"スマホアクセサリー")
appliance_pc = appliance.children.create(name:"PC/タブレット")

sport_golf = sport.children.create(name:"ゴルフ")
sport_fishing = sport.children.create(name:"フィッシング")
sport_bicycle = sport.children.create(name:"自電車")

handmade_accessorie = handmade.children.create(name:"アクセサリー(女性用)")
handmade_small = handmade.children.create(name:"ファッション/小物")
handmade_clock = handmade.children.create(name:"アクセサリー/時計")

ticket_music = ticket.children.create(name:"音楽")
ticket_sport = ticket.children.create(name:"スポーツ")
ticket_theater = ticket.children.create(name:"演劇/芸能")

bicycle_body = bicycle.children.create(name:"自動車本体")
bicycle_tire = bicycle.children.create(name:"自動車タイヤ/ホイール")
bicycle_parts = bicycle.children.create(name:"自電車パーツ")

another_summary = another.children.create(name:"まとめ売り")
another_pet = another.children.create(name:"ペット用品")
another_meal = another.children.create(name:"食品")

w_tops.children.create([{name:"Tシャツ/カットソー(半袖/袖無し)"},{name:"Tシャツ/カットソー(七分/長袖)"},{name:"シャツ/ブラウス(半袖/袖無し)"},{name:"シャツ/ブラウス(七分/長袖)"},{name:"ポロシャツ"},{name:"キャミソール"},{name:"タンクトップ"},{name:"ホルターネック"},{name:"ニット/セーター"},{name:"チェニック"},{name:"カーディガン/ボレロ"},{name:"アンサンブル"},{name:"ベスト/ジレ"},{name:"パーカー"}])
w_jacket.children.create([{name:"テーラードジャケット"},{name:"ノーカラージャケット"},{name:"Gジャン/デニムジャケット"},{name:"レザージャケット"},{name:"ダウンジャケット"},{name:"ライダースジャケット"},{name:"ミリタリージャケット"},{name:"ダウンベスト"},{name:"ジャンパー/ブルゾン"},{name:"ポンチョ"},{name:"ロングコート"},{name:"トレンチコート"},{name:"ダッフルコート"},{name:"Pコート"}])
w_pants.children.create([{name:"デニム/ジーンズ"},{name:"ショートパンツ"},{name:"カジュアルパンツ"},{name:"ハーフパンツ"},{name:"チノパン"},{name:"ワークパンツ/カーゴパンツ"},{name:"クロップドパンツ"},{name:"サロペット/オーバーオール"},{name:"オールインワン"},{name:"サルエルパンツ"},{name:"ガウチョパンツ"},{name:"その他"}])
w_skirt.children.create([{name:"ミニスカート"},{name:"ひざ丈スカート"},{name:"ロングスカート"},{name:"キュロット"},{name:"その他"}])
w_onepiece.children.create([{name:"ミニワンピース"},{name:"ひざ丈ワンピース"},{name:"ロングワンピース"},{name:"その他"}])
w_shoes.children.create([{name:"ハイヒール/パンプス"},{name:"ブーツ"},{name:"サンダル"},{name:"スニーカー"},{name:"ミュール"},{name:"モカシン"},{name:"ローファー/革靴"},{name:"フラットシューズ/バレエシューズ"},{name:"長靴/レインシューズ"},{name:"その他"}])
w_roomwear.children.create([{name:"パジャマ"},{name:"ルームウェア"}])
w_regwear.children.create([{name:"ソックス"},{name:"スパッツ/レギンス"},{name:"ストッキング/タイツ"},{name:"レッグウォーマー"},{name:"その他"}])
w_hat.children.create([{name:"ニットキャップ/ビーニー"},{name:"ハット"},{name:"ハンチング/ベレー帽"},{name:"キャップ"},{name:"キャスケット"},{name:"麦わら帽子"},{name:"その他"}])
w_shoes.children.create([{name:"ニットキャップ/ビーニー"},{name:"ハット"},{name:"ハンチング/ベレー帽"},{name:"キャップ"},{name:"キャスケット"},{name:"麦わら帽子"},{name:"その他"}])
w_bag.children.create([{name:"ハンドバッグ"},{name:"トートバッグ"},{name:"エコバッグ"},{name:"リュック/バックパック"},{name:"ボストンバッグ"},{name:"スポーツバッグ"},{name:"ショルダーバッグ"},{name:"クラッチバッグ"},{name:"ポーチ/バニティ"},{name:"ボディバッグ/ウェストバッグ"},{name:"マザーズバッグ"},{name:"メッセンジャーバッグ"},{name:"ビジネスバッグ"},{name:"旅行用バッグ/キャリーバッグ"}])
w_accessorie.children.create([{name:"ネックレス"},{name:"ブレスレット"},{name:"バングル/リストバンド"},{name:"リング"},{name:"ピアス(片耳用)"},{name:"ピアス(両耳用)"},{name:"イヤリング"},{name:"アンクレット"},{name:"ブローチ/コサージュ"},{name:"チャーム"},{name:"その他"}])
w_hearaccessorie.children.create([{name:"ヘアゴム/シュシュ"},{name:"ヘアバンド/カチューシャ"},{name:"ヘアピン"},{name:"その他"}])
w_smallarticle.children.create([{name:"長財布"},{name:"折り財布"},{name:"コインケース/小銭入れ"},{name:"名刺入れ/定期入れ"},{name:"キーケース"},{name:"キーホルダー"},{name:"手袋/アームカバー"},{name:"ハンカチ"},{name:"ベルト"},{name:"マフラー/ショール"},{name:"ストール/スヌード"},{name:"バンダナ/スカーフ"},{name:"ネックウォーマー"},{name:"サスペンダー"}])
w_clock.children.create([{name:"腕時計(アナログ)"},{name:"腕時計(デジタル)"},{name:"ラバーベルト"},{name:"レザーベルト"},{name:"金属ベルト"},{name:"その他"}])

m_tops.children.create([{name:"Tシャツ/カットソー(半袖/袖無し)"},{name:"Tシャツ/カットソー(七分/長袖)"},{name:"シャツ"},{name:"ポロシャツ"},{name:"タンクトップ"},{name:"ニット/セーター"},{name:"パーカー"},{name:"カーディガン"},{name:"スウェット"},{name:"ジャージ"},{name:"ベスト"},{name:"その他"}])
m_jacket.children.create([{name:"テーラードジャケット"},{name:"ノーカラージャケット"},{name:"Gジャン/デニムジャケット"},{name:"レザージャケット"},{name:"ダウンジャケット"},{name:"ライダースジャケット"},{name:"ミリタリージャケット"},{name:"ナイロンジャケット"},{name:"ダッフルコート"},{name:"ピーコート"},{name:"ステンカラーコート"},{name:"トレンチコート"},{name:"モッズコート"}])
m_pants.children.create([{name:"デニム/ジーンズ"},{name:"ワークパンツ/カーゴパンツ"},{name:"スラックス"},{name:"チノパン"},{name:"ショートパンツ"},{name:"ペインターパンツ"},{name:"サルエルパンツ"},{name:"オーバーオール"},{name:"その他"}])
m_shoes.children.create([{name:"スニーカー"},{name:"サンダル"},{name:"ブーツ"},{name:"モカシン"},{name:"ドレス/ビジネス"},{name:"長靴/レインシューズ"},{name:"デッキシューズ"},{name:"その他"}])
m_bag.children.create([{name:"ショルダーバッグ"},{name:"トートバッグ"},{name:"ボストンバッグ"},{name:"リュック/バックパック"},{name:"ウエストポーチ"},{name:"ボディーバッグ"},{name:"ドラムバッグ"},{name:"ビジネスバッグ"},{name:"トラベルバッグ"},{name:"メッセンジャーバッグ"},{name:"エコバッグ"},{name:"その他"}])
m_suit.children.create([{name:"スーツジャケット"},{name:"スーツベスト"},{name:"スラックス"},{name:"セットアップ"},{name:"その他"}])
m_hat.children.create([{name:"キャップ"},{name:"ハット"},{name:"ニットキャップ/ビーニー"},{name:"ハンチング/ベレー帽"},{name:"キャスケット"},{name:"サンバイザー"},{name:"その他"}])
m_accessorie.children.create([{name:"ネックレス"},{name:"ブレスレット"},{name:"バングル/リストバンド"},{name:"リング"},{name:"ピアス(片耳用)"},{name:"ピアス(両耳用)"},{name:"アンクレット"},{name:"その他"}])
m_smallarticle.children.create([{name:"長財布"},{name:"折り財布"},{name:"マネークリップ"},{name:"コインケース/小銭入れ"},{name:"名刺入れ/定期入れ"},{name:"キーケース"},{name:"キーホルダー"},{name:"ネクタイ"},{name:"手袋"},{name:"ハンカチ"},{name:"ベルト"},{name:"マフラー"},{name:"ストール"},{name:"バンダナ"}])
m_clock.children.create([{name:"腕時計(アナログ)"},{name:"腕時計(デジタル)"},{name:"ラバーベルト"},{name:"レザーベルト"},{name:"金属ベルト"},{name:"その他"}])
m_swimwear.children.create([{name:"一般水着"},{name:"スポーツ用"},{name:"アクセサリー"},{name:"その他"}])
m_regwear.children.create([{name:"ソックス"},{name:"スパッツ/レギンス"},{name:"レッグウォーマー"},{name:"その他"}])
m_underwear.children.create([{name:"トランクス"},{name:"ボクサーパンツ"},{name:"その他"}])

kids_girl_under_95.children.create([{name:"トップス"},{name:"アウター"},{name:"パンツ"},{name:"スカート"},{name:"ワンピース"},{name:"ベビードレス"},{name:"おくるみ"},{name:"下着/肌着"},{name:"パジャマ"},{name:"ロンパース"},{name:"その他"}])
kids_boy_under_95.children.create([{name:"トップス"},{name:"アウター"},{name:"パンツ"},{name:"おくるみ"},{name:"下着/肌着"},{name:"パジャマ"},{name:"ロンパース"},{name:"その他"}])
kids_girl_and_boy_under_95.children.create([{name:"トップス"},{name:"アウター"},{name:"パンツ"},{name:"おくるみ"},{name:"下着/肌着"},{name:"パジャマ"},{name:"ロンパース"},{name:"その他"}])
kids_girl_over_100.children.create([{name:"コート"},{name:"ジャケット/上着"},{name:"トップス(Tシャツ/カットソー)"},{name:"トップス(トレーナー)"},{name:"トップス(チェニック)"},{name:"トップス(タンクトップ)"},{name:"トップス(その他)"},{name:"スカート"},{name:"パンツ"},{name:"ワンピース"},{name:"セットアップ"},{name:"パジャマ"},{name:"フォーマル/ドレス"},{name:"和服"}])
kids_boy_over_100.children.create([{name:"コート"},{name:"ジャケット/上着"},{name:"トップス(Tシャツ/カットソー)"},{name:"トップス(トレーナー)"},{name:"トップス(その他)"},{name:"パンツ"},{name:"セットアップ"},{name:"パジャマ"},{name:"フォーマル/ドレス"},{name:"和服"},{name:"浴衣"},{name:"甚平"},{name:"水着"},{name:"その他"}])
kids_girl_and_boy_over_100.children.create([{name:"コート"},{name:"ジャケット/上着"},{name:"トップス(Tシャツ/カットソー)"},{name:"トップス(トレーナー)"},{name:"トップス(その他)"},{name:"ボトムス"},{name:"パジャマ"},{name:"その他"}])
kids_shoes.children.create([{name:"スニーカー"},{name:"サンダル"},{name:"ブーツ"},{name:"長靴"},{name:"その他"}])
kids_small.children.create([{name:"靴下/スパッツ"},{name:"帽子"},{name:"エプロン"},{name:"サスペンダー"},{name:"タイツ"},{name:"ハンカチ"},{name:"バンダナ"},{name:"ベルト"},{name:"マフラー"},{name:"傘"},{name:"手袋"},{name:"スタイ"},{name:"バッグ"},{name:"その他"}])
kids_bath.children.create([{name:"おむつ用品"},{name:"おまる/補助便座"},{name:"トレーニングパンツ"},{name:"ベビーバス"},{name:"お風呂用品"},{name:"その他"}])
kids_out.children.create([{name:"ベビーカー"},{name:"抱っこひも/スリング"},{name:"チャイルドシート"},{name:"その他"}])
kids_meal.children.create([{name:"ミルク"},{name:"ベビーフード"},{name:"ベビー用食器"},{name:"その他"}])
kids_furniture.children.create([{name:"ベッド"},{name:"布団/毛布"},{name:"イス"},{name:"たんす"},{name:"その他"}])
kids_toy.children.create([{name:"おふろのおもちゃ"},{name:"がらがら"},{name:"オルゴール"},{name:"ベビージム"},{name:"手押し車/カタカタ"},{name:"知育玩具"},{name:"その他"}])
kids_souvenir.children.create([{name:"お宮参り用品"},{name:"お食い初め用品"},{name:"アルバム"},{name:"手形/足形"},{name:"その他"}])

interior_kitchen.children.create([{name:"食器"},{name:"調理器具"},{name:"収納/キッチン雑貨"},{name:"弁当用品"},{name:"カトラリー(スプーン等)"},{name:"テーブル用品"},{name:"容器"},{name:"エプロン"},{name:"アルコールグッズ"},{name:"浄水器"},{name:"その他"}])
interior_mat.children.create([{name:"セミシングベッド"},{name:"シングルベッド"},{name:"セミダブルベッド"},{name:"ダブルベッド"},{name:"ワイドダブルベッド"},{name:"クイーンベッド"},{name:"キングベッド"},{name:"脚付きマットレスベッド"},{name:"マットレス"},{name:"すのこベッド"},{name:"ロフトベッド/システムベッド"},{name:"簡易ベッド/折りたたみベッド"},{name:"収納付き"},{name:"その他"}])
interior_sofa.children.create([{name:"ソファセット"},{name:"シングルソファ"},{name:"ラブソファ"},{name:"トリプルソファ"},{name:"オットマン"},{name:"コーナーソファ"},{name:"ビーズソファ/クッションソファ"},{name:"ローソファ/フロアソファ"},{name:"ソファベッド"},{name:"応接セット"},{name:"ソファカバー"},{name:"リクライニングソファ"},{name:"その他"}])
interior_chair.children.create([{name:"一般"},{name:"スツール"},{name:"ダイニングチェア"},{name:"ハイバックチェア"},{name:"ロッキングチェア"},{name:"座椅子"},{name:"折り畳み椅子"},{name:"デスクチェア"},{name:"その他"}])
interior_desk.children.create([{name:"こたつ"},{name:"カウンターテーブル"},{name:"サイドテーブル"},{name:"センターテーブル"},{name:"ダイニングテーブル"},{name:"座卓/ちゃぶ台"},{name:"アウトドア用"},{name:"パソコン用"},{name:"事務机/学習机"},{name:"その他"}])
interior_storage.children.create([{name:"リビング収納"},{name:"キッチン収納"},{name:"玄関/屋外収納"},{name:"バス/トイレ収納"},{name:"本収納"},{name:"本/CD/DVD収納"},{name:"洋服タンス/押入れ収納"},{name:"電話台/ファックス台"},{name:"ドレッサー/鏡台"},{name:"棚/ラック"},{name:"ケース/ボックス"},{name:"その他"}])
interior_rag.children.create([{name:"ラグ"},{name:"カーペット"},{name:"ホットカーペット"},{name:"玄関/キッチンマット"},{name:"トイレ/バスマット"},{name:"その他"}])
interior_karten.children.create([{name:"カーテン"},{name:"ブラインド"},{name:"ロールスクリーン"}])
interior_light.children.create([{name:"蛍光灯/電球"},{name:"天井照明"},{name:"フロアスタンド"},{name:"その他"}])

hobby_book.children.create([{name:"文学/小説"},{name:"人文/社会"},{name:"ノンフィクション/教養"}])
hobby_comic.children.create([{name:"全巻セット"},{name:"少年漫画"},{name:"少女漫画"}])
hobby_magazine.children.create([{name:"アート/エンタメ/ホビー"},{name:"ファッション"},{name:"ニュース"}])

goods_toy.children.create([{name:"キャラクターグッズ"},{name:"ぬいぐるみ"},{name:"小物/アクセサリー"}])
goods_tarent.children.create([{name:"アイドル"},{name:"ミュージシャン"},{name:"タレント/お笑い芸人"}])
goods_anime.children.create([{name:"ストラップ"},{name:"キーホルダー"},{name:"バッジ"}])

cosmetic_base.children.create([{name:"ファンデーション"},{name:"化粧下地"},{name:"コントロールカラー"}])
cosmetic_make.children.create([{name:"アイシャドウ"},{name:"口紅"},{name:"リップグロス"}])
cosmetic_nail.children.create([{name:"ネイルカラー"},{name:"カラージェル"},{name:"ネイルベースコート/トップコート"}])

appliance_phone.children.create([{name:"スマートフォン本体"},{name:"バッテリー/充電器"},{name:"携帯電話本体"}])
appliance_accessorie.children.create([{name:"Android用ケース"},{name:"iphone用ケース"},{name:"カバー"}])
appliance_pc.children.create([{name:"タブレット"},{name:"ノートPC"},{name:"デスクトップ型PC"}])

sport_golf.children.create([{name:"クラブ"},{name:"ウエア(男性用)"},{name:"ウエア(女性用)"}])
sport_fishing.children.create([{name:"ロッド"},{name:"リール"},{name:"ルアー用品"}])
sport_bicycle.children.create([{name:"自電車本体"},{name:"ウエア"},{name:"パーツ"}])

handmade_accessorie.children.create([{name:"ピアス"},{name:"イヤリング"},{name:"ネックレス"}])
handmade_small.children.create([{name:"バッグ(女性用)"},{name:"バッグ(男性用)"},{name:"ファッション雑貨"}])
handmade_clock.children.create([{name:"アクセサリー(男性用)"},{name:"時計(女性用)"},{name:"時計(男性用)"}])

ticket_music.children.create([{name:"男性アイドル"},{name:"女性アイドル"},{name:"韓流"}])
ticket_sport.children.create([{name:"サッカー"},{name:"野球"},{name:"テニス"}])
ticket_theater.children.create([{name:"ミュージカル"},{name:"演劇"},{name:"伝統芸能"}])

bicycle_body.children.create([{name:"国内自動車本体"},{name:"国外自動車本体"}])
bicycle_tire.children.create([{name:"タイヤ/ホイールセット"},{name:"タイヤ"},{name:"ホイール"}])
bicycle_parts.children.create([{name:"サスペンション"},{name:"ブレーキ"},{name:"外装/エアロパーツ"}])

another_pet.children.create([{name:"ペットフード"},{name:"犬用品"},{name:"猫用品"}])
another_meal.children.create([{name:"菓子"},{name:"米"},{name:"野菜"}])
