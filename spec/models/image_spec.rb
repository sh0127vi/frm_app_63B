require 'rails_helper'

describe Image do
  describe '画像' do
    

    it "画像が空では登録できない" do
      image = build(:image, images: nil)
      image.valid?
      expect(image.errors[:images]).to include("Imagesを入力してください")
    end
  
     it "画像が空でなければ登録できる" do
      image = build(:image)
      expect(image).to be_valid
    end
      
   end
 end