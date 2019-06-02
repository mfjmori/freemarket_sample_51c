class BuyOrder < ApplicationRecord
  has_many :messages
  belongs_to :item
  belongs_to :saler, class_naem "User"
  belongs_to :buyer, class_naem "User"
end
