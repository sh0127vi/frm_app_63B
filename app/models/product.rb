class Product < ApplicationRecord
  # アソシエーション

  belongs_to :user
  has_many   :images,      dependent: :destroy
  belongs_to :category
  belongs_to :brand, optional: true
  has_many   :likes_users, through: :user, source: :user
  has_one    :purchase
  has_many   :comments
  accepts_nested_attributes_for :images, allow_destroy: true
  def previous
    Product.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Product.where("id > ?", self.id).order("id ASC").first
  end
end
