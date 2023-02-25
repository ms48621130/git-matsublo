class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy

  validates :tag_name, presence: true
end
