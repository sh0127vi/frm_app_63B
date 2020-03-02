class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_one :address, dependent: :destroy
  has_one :credit_card, dependent: :destroy
  has_one :address
  accepts_nested_attributes_for :address
  has_many :products
  has_many :purchases, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_products, through: :likes, source: :product
  has_many :comments
end
