require 'rails_helper'
describe UsersController do
  describe '#new' do
    it "renders the :new template" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the :registration template" do
      get :new, params: { url: "registration" }
      expect(response).to have_http_status(:success)
    end

    it "renders the :address template" do
      get :new, params: { url: "address", user: {name: "タナカー", email: "test@gmail.com", password: "11111111",password_confirmation: "11111111", last_name: "田中",first_name: "太郎", last_name_kana: "タナカ", first_name_kana: "タロウ", "birthday(1i)": "1997","birthday(2i)": "01", "birthday(3i)": "23"} }
      expect(response).to have_http_status(:success)
    end

    it "renders the :card template" do
      get :new, params: { url: "card", user: {postal_code: "1112222", prefecture: "hokkaido", city: "田中区", address: "田中町1-11-1", building: "田中ビル", phone: "00011112222"}}
      expect(response).to have_http_status(:success)
    end

    it "renders the :complete template" do
      get :new, params: { url: "complete"}, session: {name: "タナカー", email: "test@gmail.com", password: "11111111",password_confirmation: "11111111", last_name: "田中",first_name: "太郎", last_name_kana: "タナカ", first_name_kana: "タロウ", "birthday(1i)": "1997", "birthday(2i)": "01", "birthday(3i)": "23", postal_code: "1112222", prefecture: "hokkaido", city: "田中区", address: "田中町1-11-1", building: "田中ビル", phone: "00011112222"}
      expect(response).to have_http_status(:success)
    end
  end

end
