class Product < ApplicationRecord
  # アソシエーション
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  belongs_to :brand, optional: true
  has_one    :purchase
  has_many   :images,      dependent: :destroy
  has_many   :comments
  has_many   :likes, dependent: :destroy
  has_many   :like_users, through: :likes, source: :user

  accepts_nested_attributes_for :images, allow_destroy: true
  
  def previous
    Product.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Product.where("id > ?", self.id).order("id ASC").first
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
