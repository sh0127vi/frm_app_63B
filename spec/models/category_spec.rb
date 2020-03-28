require 'rails_helper'

describe Category do
  describe 'カテゴリー' do

    it "カテゴリーが空では登録できない" do
      category = build(:category, name: "")
      category.valid?
      expect(category.errors[:name]).to include("Nameを入力してください")
    end
  
    it "カテゴリーが空でなければ登録できる" do
      category = build(:category, name: "メンズ")
      category.valid?
      expect(category).to be_valid
    end
      
  end
end