require 'rails_helper'

describe ItemsController do
  before do
    @params ={id: 1,name: nikc,saler_id: 1,buyer_id: 2}
  end
  describe '#show' do
    it "renders the :show template" do
      get :show, params: @params
    end
  end
end
