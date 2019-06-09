FactoryBot.define do
  factory :card do
    name { "名前" }
    host_name { "主催者の名前" }
    regulation { "参加条件" }
    explanation { "説明" }
    user
  end
end