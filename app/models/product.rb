class Product < ApplicationRecord
  # アソシエーション

  belongs_to :user
  has_many   :images,      dependent: :destroy
  belongs_to :category,    dependent: :destroy
  has_many   :likes,       dependent: :destroy
  has_many   :likes_users, through: :user, source: :user
  has_one    :purchase
  has_many   :comments
  accepts_nested_attributes_for :images, allow_destroy: true

  validate :image_validate

  def previous
    Product.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Product.where("id > ?", self.id).order("id ASC").first
  end
end
