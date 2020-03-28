class Category < ApplicationRecord

# アソシエーション
  has_many :products
  has_ancestry

# バリデーション 
  validates :name, presence: true
end
