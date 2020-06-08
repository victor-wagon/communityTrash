class Meal < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :title, :description, :rating, :user, :capacity, presence: true
end
