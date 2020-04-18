class Product < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many   :images,      dependent: :destroy
  belongs_to :brand, optional: true
  belongs_to :category
  has_one    :purchase
  has_many   :comments, dependent: :destroy
  has_many   :likes, dependent: :destroy
  has_many   :like_users, through: :likes, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  

  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank
  
  def previous
    Product.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Product.where("id > ?", self.id).order("id ASC").first
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def self.search(search)
    return Product.all unless search
    Product.where('name LIKE(?)', "%#{search}%")
  end
  
  # バリデーション
  validates :images, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :condition, presence: true
  validates :prefecture_id, presence: true          #prefecture_id 配送元
  validates :delivery, presence: true      #発送までの日数 stringに変更
  validates :fee_payer, presence: true     #配送料の負担
  

end
