class PurchasesController < ApplicationController
  before_action :set_product

  def buy
    @parents = Category.all.order("id ASC").limit(13)
    @image = @product.images.all
    @user = current_user

    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    @card = CreditCard.find_by(user_id: current_user.id)
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

  require "payjp"

  def pay
    @parents = Category.all.order("id ASC").limit(13)

    @product.with_lock do
      @card = CreditCard.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      charge = Payjp::Charge.create(
      amount: @product.price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
      )

      @purchase = Purchase.create(buyer_id: current_user.id, product_id: params[:product_id])

      if @purchase.save
      else
        redirect_to buy_product_path(@product.id), alert: '購入未完了'
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
