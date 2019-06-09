class BuyOrdersController < ApplicationController
  layout 'user_application'
  require 'payjp'

  def new

    @item = Item.where(saler_id: params[:item_id]).first
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    item = Item.where(saler_id: params[:item_id]).first
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => item.price, 
      :customer => card.customer_id,
      :currency => 'jpy',
    )
  end
end
