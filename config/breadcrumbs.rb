# 1番目
crumb :root do
  link "トップページ", root_path
end

# 2番目
crumb :new_user do
  link "新規登録", new_user_registration_path
end

crumb :session_user do
  link "ログイン", user_session_path
end

crumb :product_show do
  @product = Product.find(params[:id])
  link @product.name, product_path
end

crumb :product_new do
  link "出品", new_product_path
end

crumb :mypage do
  link "マイページ", users_path(current_user.id)
end

# 3番目
crumb :like do
  link "いいね！一覧", product_like_path
  parent :mypage
end

crumb :card_new do
  link "クレジットカード登録", new_credit_card_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

# 3番目に修正
crumb :card_show do
  link "クレジットカード情報", credit_card_path
  parent :mypage
end