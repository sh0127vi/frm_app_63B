class Image < ApplicationRecord
  # アソシエーション
  belongs_to :product
  mount_uploader :image, ImageUploader
end
