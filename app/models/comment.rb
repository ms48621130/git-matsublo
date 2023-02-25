class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates :reply, presence: true
end
