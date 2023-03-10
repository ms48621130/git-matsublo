class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
  validates :tag_name, presence: true
end

def self.tag_name_search(tag_names)
  tag_names.each do |tag_name|
    where(["tag_name like?", "#{tag_name}"])
  end

end