class Item < ApplicationRecord

  belongs_to :saler, class_name "User"
  belongs_to :buyer, class_name "User"
  belongs_to :categorie
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :buy_order
end
