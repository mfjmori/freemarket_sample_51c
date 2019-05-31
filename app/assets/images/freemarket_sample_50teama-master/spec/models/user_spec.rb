require 'rails_helper'

describe 'user validation' do
  it "is valid with all" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name][0]).to include("name.blank")
  end

  it "is invalid with a name that has more than 20 characters " do
    user = build(:user, name: "aiueoaiueoaiueoaiueoaiueoa")
    user.valid?
    expect(user.errors[:name][0]).to include("too_long")
  end

  it "is invalid without a email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email][0]).to include("email.blank")
  end

  it "is invalid with a duplicate email address" do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email][0]).to include("email.taken")
  end

  it "is invalid without a password" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password][0]).to include("password.blank")
  end

  it "is invalid without a password_confirmation although with a password" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation][0]).to include("password_confirmation.confirmation")
  end

  it "is invalid without a first_name" do
    user = build(:user, first_name: "")
    user.valid?
    expect(user.errors[:first_name][0]).to include("first_name.blank")
  end

  it "is invalid without a last_name" do
    user = build(:user, last_name: "")
    user.valid?
    expect(user.errors[:last_name][0]).to include("last_name.blank")
  end

  it "is invalid without a first_name_kana" do
    user = build(:user, first_name_kana: "")
    user.valid?
    expect(user.errors[:first_name_kana][0]).to include("first_name_kana.blank")
  end

  it "is invalid with first_name_kana is not katakana" do
    user = build(:user, first_name_kana: "あべ")
    user.valid?
    expect(user.errors[:first_name_kana][0]).to include("first_name_kana.invalid")
  end

  it "is invalid without a last_name_kana" do
    user = build(:user, last_name_kana: "")
    user.valid?
    expect(user.errors[:last_name_kana][0]).to include("last_name_kana.blank")
  end

  it "is invalid with last_name_kana is not katakana" do
    user = build(:user, last_name_kana: "いちろう")
    user.valid?
    expect(user.errors[:last_name_kana][0]).to include("last_name_kana.invalid")
  end

  it "is invalid without a postal_code" do
    user = build(:user, postal_code: "")
    user.valid?
    expect(user.errors[:postal_code][0]).to include("postal_code.blank")
  end

  it "is invalid without a prefecture" do
    user = build(:user, prefecture: "")
    user.valid?
    expect(user.errors[:prefecture][0]).to include("prefecture.blank")
  end

  it "is invalid without a city" do
    user = build(:user, city: "")
    user.valid?
    expect(user.errors[:city][0]).to include("city.blank")
  end

  it "is invalid without a address" do
    user = build(:user, address: "")
    user.valid?
    expect(user.errors[:address][0]).to include("address.blank")
  end

  it "is valid without a building" do
    user = build(:user, building: "")
    expect(user).to be_valid
  end

  it "is valid without a phone" do
    user = build(:user, phone: "")
    expect(user).to be_valid
  end

  it "is invalid without a birthday" do
    user = build(:user, birthday: "")
    user.valid?
    expect(user.errors[:birthday][0]).to include("birthday.blank")
  end

  it "is valid without a money" do
    user = build(:user, money: "")
    expect(user).to be_valid
  end

  it "is valid without a point" do
    user = build(:user, point: "")
    expect(user).to be_valid
  end

  it "is invalid without a seller_id" do
    user = build(:user, seller_id: "")
    user.valid?
    expect(user.errors[:seller_id][0]).to include("seller_id.blank")
  end

  it "is invalid without a buyer_id" do
    user = build(:user, buyer_id: "")
    user.valid?
    expect(user.errors[:buyer_id][0]).to include("buyer_id.blank")
  end

  it "is valid without a profile" do
    user = build(:user, profile: "")
    expect(user).to be_valid
  end

  it "is valid without a provider" do
    user = build(:user, provider: "")
    expect(user).to be_valid
  end

  it "is valid without a uid" do
    user = build(:user, uid: "")
    expect(user).to be_valid
  end

  it "is valid without a payjp_id" do
    user = build(:user, payjp_id: "")
    expect(user).to be_valid
  end
end
