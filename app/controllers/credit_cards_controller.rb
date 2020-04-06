class CreditCardsController < ApplicationController

  require "payjp"

  before_action :find_current_user_credit_card, only:[:new, :show, :destroy]

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(current_user.id) if card.exists?
  end

  def index #createビュー確認用
    render "destroy"
  end
  
  def show
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)

      ##カードのアイコン表示のための定義づけ
      @card_brand = @customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.gif"
      when "JCB"
        @card_src = "jcb.gif"
      when "MasterCard"
        @card_src = "master.png"
      when "American Express"
        @card_src = "amex.gif"
      when "Diners Club"
        @card_src = "diners.gif"
      when "Discover"
        @card_src = "discover.gif"
      end

      ##有効期限'月'を定義
      @exp_month = @customer_card.exp_month.to_s
      ##有効期限'年'を定義
      @exp_year = @customer_card.exp_year.to_s.slice(2,3)
    end
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params["payjp_token"].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした。"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy
    if @card.blank?
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete

      if @card.destroy
      else
        redirect_to credit_card_path(current_user.id), alert: "削除できませんでした。"
      end
    end
  end

  private

  def find_current_user_credit_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end


end
