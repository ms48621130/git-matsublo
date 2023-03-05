class Post < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
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

  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(tag_name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

end
