class Place < ApplicationRecord
  belongs_to :post
  validates :latitude, :longitude, presence: true
end
