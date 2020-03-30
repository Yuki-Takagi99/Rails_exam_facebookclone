class Blog < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 300 }
  mount_uploader :image, ImageUploader
  # アソシエーションの定義
  belongs_to :user
  # Blogと一対多で紐づいているFavoriteモデルのレコードを前件取得
  # destroyメソッドでブログが削除されると同時にお気に入り情報も削除
  has_many :favorites, dependent: :destroy
  # through: :favoritesでfavoritesを通過して、source: :userでuserの情報を取得する
  has_many :favorite_users, through: :favorites, source: :user
end
