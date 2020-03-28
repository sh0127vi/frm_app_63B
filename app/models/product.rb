class Product < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many   :images,      dependent: :destroy
  belongs_to :brand, optional: true
  belongs_to :category
  has_one    :purchase
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
  # アソシエーション
  

  # バリデーション
  validates :name, presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :condition, presence: true
  validates :city, presence: true          #city 配送元
  validates :delivery, presence: true      #発送までの日数 stringに変更
  

end
