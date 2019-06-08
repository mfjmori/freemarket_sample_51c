FactoryBot.define do
  factory :image do
    item    {build(:item)}
    image   {File.open("#{Rails.root}/public/uploads/image/image/1/dog_cat_nakayoshi.png")}
  end
end
