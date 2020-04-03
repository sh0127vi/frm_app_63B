require 'rails_helper'

describe Product do
  describe '商品出品' do


# 商品名40文字まで
  it "商品名が40文字以上は登録できない " do
    product = build(:product, name: "a"*41)
    product.valid?
    expect(product.errors[:name]).to include("は40文字以内で入力してください")
  end

  it "商品名が空では登録できない " do
    product = build(:product, name: "")
    product.valid?
    expect(product.errors[:name]).to include("Nameを入力してください")
  end

  it "商品名が40文字以上は登録できる " do
    product = build(:product, name: "a"*39)
    product.valid?
    expect(product).to be_valid
  end


# 商品説明
  it "商品説明が1000文字以上は登録できない " do
    product = build(:product, detail: "a"*1001)
    product.valid?
    expect(product.errors[:detail]).to include("は1000文字以内で入力してください")
  end
  
  it "商品説明が空では登録できない " do
    product = build(:product, detail: "")
    product.valid?
    expect(product.errors[:detail]).to include("Detailを入力してください")
  end

  it "商品説明が1000文字以内は登録できる " do
    product = build(:product, detail: "a"*999)
    product.valid?
    expect(product).to be_valid
  end


#商品の状態
  it "商品状態が空では登録できない " do
    product = build(:product, condition: "")
    product.valid?
    expect(product.errors[:condition]).to include("Conditionを入力してください")
  end

  it "商品状態が空でなければ登録できる " do
    product = build(:product, condition: "a")
    product.valid?
    expect(product).to be_valid
  end


# 配送料の負担
  it "配送料の負担が空では登録できない " do
    product = build(:product, fee_payer: "")
    product.valid?
    expect(product.errors[:fee_payer]).to include("Fee payerを入力してください")
  end

  it "配送料の負担が空でなければ登録できる " do
    product = build(:product, fee_payer: "1")
    product.valid?
    expect(product).to be_valid
  end


# 発送元の地域
  it "発送元の地域が空では登録できない " do
    product = build(:product, city: "")
    product.valid?
    expect(product.errors[:city]).to include("Cityを入力してください")
  end

  it "発送元の地域が空でなければ登録できる " do
    product = build(:product, city: "a")
    product.valid?
    expect(product).to be_valid
  end


#  発送先の地域
#   it "発送先の地域が空では登録できない " do
#     product = build(:product, delivery_area: "")
#     product.valid?
#     expect(product.errors[:delivery_area]).to include("Delivery areaを入力してください")
#   end

#   it "発送先の地域が空でなければ登録できる " do
#     product = build(:product, delivery_area: "a")
#     product.valid?
#     expect(product).to be_valid
#   end


# 発送までの日数
  it "発送までの日数が空では登録できない " do
    product = build(:product, delivery: "")
    product.valid?
    expect(product.errors[:delivery]).to include("Deliveryを入力してください")
  end

  it "発送までの日数が空でなければ登録できる " do
    product = build(:product, delivery: "1a")
    product.valid?
    expect(product).to be_valid
  end


# 価格
    it "価格が300以下は登録できない " do
      product = build(:product, price: "299")
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end

    it "価格が300以上であれば登録できる" do
      product = build(:product, price: "301")
      product.valid?
      expect(product).to be_valid
    end

    it "価格が空では登録できない " do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("Priceを入力してください", "は数値で入力してください")
    end

    it "価格が10000000以上であれば登録できない" do
      product = build(:product, price: "10000000")
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end

    it "価格が10000000以下であれば登録できる" do
      product = build(:product, price: "9999999")
      product.valid?
      expect(product).to be_valid
    end

  end
end