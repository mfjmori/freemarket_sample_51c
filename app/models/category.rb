class Category < ApplicationRecord
  has_many :items
  belongs_to :parent, class_name: :Category, optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id

  scope :child_num, -> (child) {where(parent_id: child)}
end
