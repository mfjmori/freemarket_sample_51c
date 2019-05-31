class User < ApplicationRecord
  require 'valid_columns'

  has_many :likes
  has_many :user_items
  has_many :items, through: :user_items
  belongs_to :card, optional: true

  with_options presence: true do
    validates :name
    validates :address
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :postal_code
    validates :prefecture
    validates :city
    validates :address
    validates :birthday
    validates :seller_id
    validates :buyer_id
  end

  validates :name,            length: { maximum: 20 }
  validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :last_name_kana,  format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }

  enum prefecture: {
    hokkaido: 1, aomori: 2, iwate: 3, miyagi: 4, akita: 5, yamagata: 6, fukushima: 7,
    ibaraki: 8, tochigi: 9, gunma: 10, saitama: 11, chiba: 12, tokyo: 13, kanagawa: 14,
    nigata: 15, toyama: 16, ishikawa: 17, fukui: 18, yamanashi: 19, nagano: 20,
    gifu: 21, sizuoka: 22, aichi: 23, mie: 24,
    shiga: 25, kyoto: 26, osaka: 27, hyogo: 28, nara: 29, wakayama: 30,
    tottori: 31, shimane: 32, okayama: 33, hiroshima: 34, yamaguchi: 35,
    tokushima: 36, kagawa: 37, ehime: 38, kochi: 39,
    fukuoka: 40, saga: 41, nagasaki: 42, kumamoto: 43, oita: 44, miyazaki: 45, kagoshima: 46, okinawa: 47
  }, _prefix: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable
end
