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
  # アソシエーション
  

  # バリデーション
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :name, presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :condition, presence: true
  validates :fee_payer, presence: true #配送料の負担
  validates :delivery_area, presence: true #発送元の地域
  validates :delivery, presence: true #発送までの日数

end
