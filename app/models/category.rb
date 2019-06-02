class Category < ApplicationRecord
  has_many :items
  belongs_to :parent, class_name: :Category
  has_many :children, class_name: :Category, foregin_key: :parent_id
end
