class Image < ApplicationRecord
  # アソシエーション
  belongs_to :product, optional: true
  mount_uploader :images, ImageUploader
  validates :products, presence: true
  validates :images, presence: true

end
