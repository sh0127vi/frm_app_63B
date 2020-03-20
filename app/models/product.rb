class Product < ApplicationRecord
  # アソシエーション
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  validate :image_validate

  private

  def image_validate
    images.each do |image|
      if !image.content_type.in?(%('image/jpec image/png'))
        errors.add(:images, '画像ファイル以外のファイルを送付しないでください')
      end
    end
  end

end
