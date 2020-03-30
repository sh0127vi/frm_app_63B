class CreditCardsController < ApplicationController

  require "payjp"

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end
  
  def show
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params["payjp_token"].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card_id: params["payjp_token"]
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "create"
      end
    end
  end

end
