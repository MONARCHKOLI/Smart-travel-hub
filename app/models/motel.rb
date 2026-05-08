class Motel < ApplicationRecord
  has_one_attached :image
  has_many :rooms, dependent: :destroy
  validates :name, :address, presence: true
  has_many :food_items, dependent: :destroy
end
