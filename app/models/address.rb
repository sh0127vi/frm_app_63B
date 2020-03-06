class Address < ApplicationRecord
  # アソシエーション
  belongs_to :user, inverse_of: :address

  # バリデーション
  validates :f_name_kana, presence: true,
                          format: { with: /\A[ぁ-んー－]+\z/, message: "全角かなで入力してください" }
  validates :l_name_kana, presence: true,
                          format: { with: /\A[ぁ-んー－]+\z/, message: "全角かなで入力してください" }
  validates :f_name,      presence: true,
                          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください" }
  validates :l_name,      presence: true,
                          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください" }
  validates :postal_code, presence: true,
                          format:   { with: /\A\d{7}\z/, message: "半角数字7桁を入力してください" }
  validates :prefecture,  presence: true
  validates :city,        presence: true
  validates :street,      presence: true
end
