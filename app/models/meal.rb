class Meal < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :title, :description, :rating, :user, :capacity, presence: true
  has_one_attached :photo
end
