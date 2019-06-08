class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum prefecture: {unanswered:47, hokkaido: 0,aomori: 1,iwate: 2,miyagi:3,akita: 4,yamagata: 5,fukushima: 6,ibaraki: 7,tochigi: 8,gunma: 9,saitama: 10,chiba: 11,tokyo: 12,kanagawa: 13,nigata: 14,toyama: 15,ishikawa: 16,fukui: 17,yamanashi: 18,nagano: 19,gifu: 20,sizuoka: 21,aichi: 22,mie: 23,shiga: 24,kyoto: 25,osaka: 26,hyogo: 27,nara: 28,wakayama: 29,tottori: 30,shimane: 31,okayama: 32,hiroshima: 33,yamaguchi: 34,tokushima: 35,kagawa: 36,ehime: 37,kochi: 38,fukuoka: 39,saga: 40,nagasaki: 41,kumamoto: 42,oita: 43,miyazaki: 44,kagoshima: 45,okinawa: 46,
      }
  has_many :user_reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :messages
  has_many :buy_order
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_one :address
end
