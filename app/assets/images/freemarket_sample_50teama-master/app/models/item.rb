class Item < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :user_items, dependent: :destroy
  has_many :users, through: :user_items
  has_many :images, dependent: :destroy
  belongs_to :category

  accepts_nested_attributes_for :images, allow_destroy: true



  # TODO: カテゴリ実装時、特定カテゴリが入力された場合のみ:sizeが必須となる条件
  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :detail, length: {maximum: 1000}
    validates :condition
    validates :delivery_method
    validates :delivery_prefecture
    validates :delivery_day
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

  enum condition: {
    new_one: 1, almost_new: 2, no_scratchies: 3, little_worn: 4, worn: 5, bad: 6
  }

  enum delivery_cost: {
    exhibitr_barden: 1, buyer_barden: 2
  }

  enum delivery_day: {
    a_day: 1, a_couple_of_days: 2, a_week: 3
  }

  enum delivery_prefecture: {
    hokkaido: 1, aomori: 2, iwate: 3, miyagi: 4, akita: 5, yamagata: 6, fukushima: 7,
    ibaraki: 8, tochigi: 9, gunma: 10, saitama: 11, chiba: 12, tokyo: 13, kanagawa: 14,
    nigata: 15, toyama: 16, ishikawa: 17, fukui: 18, yamanashi: 19, nagano: 20,
    gifu: 21, sizuoka: 22, aichi: 23, mie: 24,
    shiga: 25, kyoto: 26, osaka: 27, hyogo: 28, nara: 29, wakayama: 30,
    tottori: 31, shimane: 32, okayama: 33, hiroshima: 34, yamaguchi: 35,
    tokushima: 36, kagawa: 37, ehime: 38, kochi: 39,
    fukuoka: 40, saga: 41, nagasaki: 42, kumamoto: 43, oita: 44, miyazaki: 45, kagoshima: 46, okinawa: 47,
    undicided: 48
  }, _prefix: true

  enum delivery_method: {
    undicided: 1, mercari: 2, u_mail: 3, letter_pack: 4, usealy: 5, yamato: 6, u_pack: 7, click_post: 8, u_packet: 9
  }, _prefix: true

  enum status: {
    not_sale: 0, sale:1, soldout:2
  }, _prefix: true

end
