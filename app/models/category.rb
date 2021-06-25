class Category < ApplicationRecord
  has_many :videos
  has_one_attached :image
end
