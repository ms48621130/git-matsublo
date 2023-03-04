class Post < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :favorites, dependent: :destroy


  with_options presence: true do
    validates :matsuri_name
    validates :season
    validates :article
    validates :image
  end

  def self.keyword_search(keyword)
    where(["matsuri_name like?", "%#{keyword}%"])
  end

  def self.season_search(season)
    where(["season like?", "#{season}"])
  end

  def self.area_search(area)
    where(["area like?", "#{area}"])
  end

end
