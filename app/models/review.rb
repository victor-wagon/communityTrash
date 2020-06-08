class Review < ApplicationRecord
  belongs_to :meal
  validates :title, :content, :rating, :meal, presence: true
end
