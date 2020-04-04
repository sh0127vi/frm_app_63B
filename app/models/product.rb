class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one    :purchase
  has_many   :images,      dependent: :destroy
  has_many   :comments
  has_many   :likes, dependent: :destroy
  has_many   :like_users, through: :likes, source: :user

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
