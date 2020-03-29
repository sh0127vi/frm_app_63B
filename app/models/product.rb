class Product < ApplicationRecord
  belongs_to :user
  has_many   :images,      dependent: :destroy
  belongs_to :category,    dependent: :destroy
  has_many   :likes,       dependent: :destroy
  has_many   :likes_users, through: :user, source: :user
  has_one    :purchase
  has_many   :comments
end
