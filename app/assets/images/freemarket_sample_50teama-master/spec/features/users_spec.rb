require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "ユーザー登録できること" do
    user = FactoryBot.build(:user)
    expect {
    visit new_user_path
    click_link "メールアドレスで登録"
    fill_in "user[name]", with: user.name
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    fill_in "user[password_confirmation]", with: user.password_confirmation
    fill_in "user[last_name]", with: user.last_name
    fill_in "user[first_name]", with: user.first_name
    fill_in "user[last_name_kana]", with: user.last_name_kana
    fill_in "user[first_name_kana]", with: user.first_name_kana
    select user.birthday.year, from: 'user[birthday(1i)]'
    select user.birthday.month, from: 'user[birthday(2i)]'
    select user.birthday.day, from: 'user[birthday(3i)]'
    click_button "次へ進む"

    fill_in "user[postal_code]", with: user.postal_code
    select "北海道" , from: 'user[prefecture]'
    fill_in "user[city]", with: user.city
    fill_in "user[address]", with: user.address
    fill_in "user[building]", with: user.building
    fill_in "user[phone]", with: user.phone
    click_button "次へ進む"

    fill_in "number", with: "4242424242424242"
    select "12", from: "exp_month"
    select "29", from: "exp-year"
    fill_in "cvc", with: "123"
    click_button "次へ進む"
    }.to change(User, :count).to(1)
  end

  scenario "ログインできること" do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"
    expect(page).not_to have_css('.login-form')
  end
end