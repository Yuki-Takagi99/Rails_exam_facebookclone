class Blog < ApplicationRecord
  validates :title, presence: true
  mount_uploader :image, ImageUploader
  # アソシエーションの定義
  belongs_to :user
end
