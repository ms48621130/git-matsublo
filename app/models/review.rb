class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comments, dependent: :destroy

  validates :star, :title, :text, presence: true
end
