crumb :root do
  link "メルカリ", root_path
end

crumb :mypages do
  link "マイページ"
  parent :root
end

crumb :profiles do
  link "プロフィール"
  parent :mypages
end

crumb :card do
  link "支払い方法"
  parent :mypages
end

crumb :card_input do
  link "クレジットカード情報入力"
  parent :card
end

crumb :addresses do
  link "本人情報の登録"
  parent :mypages
end

crumb :logout do
  link "ログアウト"
  parent :mypages
end

crumb :user_show do
  link "curent_user.nickname"
  parent :root
end

crumb :products do
  link "item.name"
  parent :root
end

crumb :categories do
  link "カテゴリー一覧"
  parent :root
end

crumb :categories_1 do
  link "categories_1"
  parent :categories
end

crumb :categories_2 do
  link "categories_2"
  parent :categories_1
end

crumb :categories_3 do
  link "categories_3"
  parent :categories_2
end
