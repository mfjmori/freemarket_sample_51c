
FactoryBot.define do

  factory :item do
    name              {Faker::Name.name}
    description       {Faker::Lorem.sentence}
    category_id       {Category.new(id: 1)}
    condition         {"new_like"}
    saler             {User.new(id: 1)}
    buyer             {User.new(id: 1)}
    postage           {"seller_cost"}
    shipping_method   {"rakuraku"}
    region            {"hokkaido"}
    shipping_date     {"two"}
    price             {1000}
  end
end
