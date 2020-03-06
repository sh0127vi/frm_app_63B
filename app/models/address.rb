class Address < ApplicationRecord
  # アソシエーション
  belongs_to :user, inverse_of: :address

  # バリデーション
  validates :f_name_kana, presence: true
  validates :l_name_kana, presence: true
  validates :f_name,      presence: true
  validates :l_name,      presence: true
  validates :postal_code, presence: true,
                          format:   { with: /\A\d{7}\z/, message: "半角数字7桁を入力してください" }
  validates :prefecture,  presence: true
  validates :city,        presence: true
  validates :street,      presence: true
end
