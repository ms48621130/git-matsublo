class Post < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :prefectures, dependent: :destroy


  with_options presence: true do
    validates :matsuri_name
    validates :season
    validates :article
    validates :image
    
  end

  accepts_nested_attributes_for :prefectures, allow_destroy: true
end
