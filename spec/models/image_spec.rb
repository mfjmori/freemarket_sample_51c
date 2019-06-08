require 'rails_helper'
describe Image, type: :model do
  describe '#create' do

    it "is invalid without a image" do
      image = build(:image, image: nil)
      image.valid?
      expect(image.errors[:image]).to include("を入力してください")
    end

  end
end
