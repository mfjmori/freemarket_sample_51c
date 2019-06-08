require 'rails_helper'
describe Item, type: :model do
  describe '#create' do

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "is invalid without a condition" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "is invalid without a postage" do
      item = build(:item, postage: nil)
      item.valid?
      expect(item.errors[:postage]).to include("を入力してください")
    end

    it "is invalid without a shipping_method" do
      item = build(:item, shipping_method: nil)
      item.valid?
      expect(item.errors[:shipping_method]).to include("を入力してください")
    end

    it "is invalid without a region" do
      item = build(:item, region: nil)
      item.valid?
      expect(item.errors[:region]).to include("を入力してください")
    end

    it "is invalid without a shipping_date" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("を入力してください")
    end

    it "is invalid without a saler" do
      item = build(:item, saler: nil)
      item.valid?
      expect(item.errors[:saler]).to include("を入力してください")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "is invalid not integer" do
      item = build(:item, price: "aaa")
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end

    it "is invalid too small" do
      item = build(:item, price: 1)
      item.valid?
      expect(item.errors[:price]).to include("は299より大きい値にしてください")
    end

    it "is invalid too large" do
      item = build(:item, price: 10000000000)
      item.valid?
      expect(item.errors[:price]).to include("は10000000より小さい値にしてください")
    end
  end
end
