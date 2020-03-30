class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence:true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! } #バリデーション判定の前に小文字に変換
  has_secure_password # passwordとpassword_confirmationを利用可能にする
  validates :password, presence: true, length: { minimum: 6 }
  # アソシエーションの定義
  has_many :blogs
  has_many :favorites, dependent: :destroy
end
