require 'rails_helper'

describe CardsController, type: :controller do
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe '#index' do
    context 'log in' do
      before do
        login user
        get :index, params:{user_id: user.id}
      end
      it "Request will be 200 OK" do
        expect(response.status).to eq 200
      end
      it "renders index" do # indexが表示されるかどうか
        expect(response).to render_template :index
      end
    end
    context 'not log in' do
      before do
        get :index, params:{user_id: user.id}
      end
      it "Request will be 302 OK" do
        expect(response.status).to eq 302
      end
      it 'redirects to user_card_path' do # log_inにredirectされるかどうか
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  describe '#card_new' do
    context'log in' do
      before do
        login user
        get :card_new, params:{user_id:"mypage", id:1}
      end
      it "Request will be 302 OK" do
        expect(response.status).to eq 302
      end
      it 'redirects to new_user_card_path' do # new_user_card_pathにredirectされているかどうか
        expect(response).to redirect_to(new_user_card_path)
      end
    end
    context'not log in' do
      before do
        get :card_new, params:{user_id:"mypage", id:1}
      end
      it "Request will be 200 OK" do
        expect(response.status).to eq 302
      end
      it 'redirect to user_session_path' do
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  describe '#card_delete' do
    context'log in' do
      before do
        login user
        get :card_delete, params:{user_id: "mypage", id:1}
      end
      it "Request will be 302 OK" do
        expect(response.status).to eq 302
      end
      it 'redirect to user_cards_path' do # root_pathにredirectされているかどうか
        expect(response).to redirect_to(user_cards_path)
      end
    end

    context'not log in' do
      before do
        get :card_delete, params:{user_id: "mypage", id:1}
      end
      it "Request will be 200 OK" do
        expect(response.status).to eq 302
      end
      it 'redirect to user_session_path' do
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  describe '#pay' do
    context'log in' do
      before do
        login user
        get :pay, params:{user_id: user.id, id: item.id}
      end
      it "Request will be 302 OK" do
        expect(response.status).to eq 302
      end
      it 'redirects to root_path' do # root_pathにredirectされているかどうか
        expect(response).to redirect_to(root_path)
      end
    end
    context'not log in'do
      it "Request will be 200 OK" do
        expect(response.status).to eq 200
      end
      it 'redirect to user_session_path' do
        get :pay, params:{user_id: user.id, id: item.id}
        expect(response).to redirect_to(user_session_path)
      end
    end
  end
end
