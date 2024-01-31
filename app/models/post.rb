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
    validates :area
    validates :article
    validates :image
  end

  def save_tag(sent_tag_names)
    current_tag_names = self.tags.pluck(&:name)
    new_tags = (sent_tag_names + current_tag_names).uniq.map do |tag_name|
      tag_name = Tag.find_or_create_by(tag_name: tag_name)
    end
    self.tags.replace(new_tags)
  end

end

