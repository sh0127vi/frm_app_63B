class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  # アソシエーション
  has_one :address
  accepts_nested_attributes_for :address
  has_one :credit_card, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_products, through: :likes, source: :product
  has_many :comments
  has_many :sns_credentials

  # バリデーション            
  validates :nickname,              presence: true,
                                    length: { in: 2..15, message: "ニックネームは2〜15文字で入力してください" },
                                    uniqueness: true
  validates :email,                 presence: true,
                                    uniqueness: { case_sensitive: false },
                                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "メールアドレスはxxx@xxx.xxxの形で入力してください" }
  validates :password,              presence: true,
                                    confirmation: true,
                                    length: { minimum: 7 }
  validates :f_name_kana,           presence: true,
                                    format: { with: /\A[ぁ-んー－]+\z/, message: "全角かなで入力してください" }
  validates :l_name_kana,           presence: true,
                                    format: { with: /\A[ぁ-んー－]+\z/, message: "全角かなで入力してください" }
  validates :f_name,                presence: true,
                                    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください" }
  validates :l_name,                presence: true,
                                    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください" }
  validates :birthday,              presence: true

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
