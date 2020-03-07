class Address < ApplicationRecord
  # アソシエーション
  belongs_to :user, inverse_of: :address

  # バリデーション
  validates :f_name_kana, presence: { message: "名前(かな)を入力してください" },
                          format: { with: /\A[ぁ-んー－]+\z/, message: "全角かなで入力してください" }
  validates :l_name_kana, presence: { message: "名字(かな)を入力してください" },
                          format: { with: /\A[ぁ-んー－]+\z/, message: "全角かなで入力してください" }
  validates :f_name,      presence: { message: "名前を入力してください" },
                          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください" }
  validates :l_name,      presence: { message: "名字を入力してください" },
                          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください" }
  validates :postal_code, presence: { message: "郵便番号を入力してください" },
                          format:   { with: /\A\d{7}\z/, message: "半角数字7桁を入力してください" }
  validates :prefecture,  presence: { message: "都道府県を入力してください" }
  validates :city,        presence: { message: "市区町村を入力してください" }
  validates :street,      presence: { message: "番地を入力してください" }
end
