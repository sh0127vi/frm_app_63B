class PurchasesController < ApplicationController
  before_action :set_product
  before_action :set_category
  before_action :set_images


  def buy
    @user = current_user

    if @user.credit_card.present?
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
  end

  require "payjp"

  def pay
    @product.with_lock do
      @card = CreditCard.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      charge = Payjp::Charge.create(
      amount: @product.price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
      )

      @purchase = Purchase.create(buyer_id: current_user.id, product_id: params[:product_id])
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_category
    @parents = Category.all.order("id ASC").limit(13)
  end

  def set_images
    @images = @product.images.all
  end
end
