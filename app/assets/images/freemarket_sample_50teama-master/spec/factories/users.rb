FactoryBot.define do

  factory :user do
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    name                  {"アベー"}
    first_name            {"阿部"}
    last_name             {"一郎"}
    first_name_kana       {"アベ"}
    last_name_kana        {"イチロウ"}
    postal_code           {"1110123"}
    prefecture            {"hokkaido"}
    city                  {"阿部区"}
    address               {"阿部町1-11-1"}
    building              {"阿部ビル"}
    phone                 {"08011112222"}
    birthday              {"1950-03-11"}
    money                 {"0"}
    point                 {"0"}
    seller_id             {"1"}
    buyer_id              {"1"}
    profile               {"阿部です"}
    provider              {"facebook"}
    uid                   {"1111"}
    payjp_id              {"cus_8f1bf365e98a8c5a6ce7f313e3c3"}
  end

end
