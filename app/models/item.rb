class Item < ApplicationRecord

enum size: {XXS: 1, XS: 2, S: 3, M: 4, L: 5, XL: 6, ２XL: 7, ３XL: 8, ４XL: 9, two_three: 10, two_three_five: 11, two_four: 12, two_four_five: 13, two_five: 14, two_five_five: 15, two_six: 16, two_six_five: 17, two_seven: 18, two_seven_five: 19, two_eight: 20, two_eight_five: 21, two_nine: 22, two_nine_five: 23, three_zero: 24, three_zero_five: 25, three_one: 26
}

enum condition: {new_item: 1, new_like: 2, no_dirt: 3, less_dirt: 4, dirt: 5, bad: 6
}

enum postage: {seller_cost: 1, buyer_cost: 2
}

enum shipping_method: {mitei: 1, rakuraku: 2, yuu: 3, letter: 4, normal: 5, cat: 6, pack: 7, post: 8, packet: 9
}

enum region: {unanswered:47, hokkaido: 0, aomori: 1, iwate: 2, miyagi: 3, akita: 4,yamagata: 5,fukushima: 6,ibaraki: 7,tochigi: 8,gunma: 9,saitama: 10,chiba: 11,tokyo: 12,kanagawa: 13,nigata: 14,toyama: 15,ishikawa: 16,fukui: 17,yamanashi: 18,nagano: 19,gifu: 20,sizuoka: 21,aichi: 22,mie: 23,shiga: 24,kyoto: 25,osaka: 26,hyogo: 27,nara: 28,wakayama: 29,tottori: 30,shimane: 31,okayama: 32,hiroshima: 33,yamaguchi: 34,tokushima: 35,kagawa: 36,ehime: 37,kochi: 38,fukuoka: 39,saga: 40,nagasaki: 41,kumamoto: 42,oita: 43,miyazaki: 44,kagoshima: 45,okinawa: 46
}

enum shipping_date: {two: 1, three: 2, seven: 3
}

  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :category, optional: true
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :buy_order
  accepts_nested_attributes_for :images
end
