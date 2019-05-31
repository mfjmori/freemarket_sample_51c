crumb :root do
  link "メルカリ", root_path
end

crumb :user do
  link "マイページ", user_path(id: 'mypage')
end

crumb :logout do
  link "ログアウト", edit_path(url: 'logout')
  parent :user
end

crumb :identification do
  link "本人情報の登録", edit_path(url: 'identification')
  parent :user
end

crumb :profile do
  link "プロフィール", edit_path(url: 'profile')
  parent :user
end

crumb :item do
  item = Item.find(params[:id])
  link item.name, item_path(id: item.id)
end

crumb :card do
  link "支払い方法", user_cards_path(id: 'index')
  parent :user
end

crumb :new_card do
  link "クレジットカード情報入力", new_user_card_path
  parent :card
end

crumb :search do
  link params[:keyword], search_items_path
end

crumb :parent_category do
  category = Category.find(params[:id])
  link category.name, category_path(id: category.id) unless category.has_parent?

  if category.parent && category.parent.has_parent?
    link category.parent.parent.name, category_path(id: category.parent.parent.id)
  elsif category.parent
    link category.parent.name, category_path(id: category.parent.id)
  end
end

crumb :child_category do
  category = Category.find(params[:id])
  if category.has_parent? && category.has_children?
    link category.name, category_path(id: category.id)
  else
    link category.parent.name, category_path(id: category.parent.id)
  end
  parent :parent_category
end

crumb :grandchild_category do
  category = Category.find(params[:id])
  link category.name, category_path(id: category.id)
  parent :child_category
end
