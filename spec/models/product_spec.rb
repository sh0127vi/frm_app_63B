require 'rails_helper'

describe Product do
  describe '#new' do


  # 値段が300円から9,999,999円の間
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

    it "価格が10000000以下であれば登録できる" do
      product = build(:product, price: "9999999")
      product.valid?
      expect(product).to be_valid
    end

    it "価格が10000000以上であれば登録できない" do
      product = build(:product, price: "10000000")
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end

  end
end