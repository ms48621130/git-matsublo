class Post < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :matsuri_name, :season, :spot, :article, presence: true
end
