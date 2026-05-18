class Motel < ApplicationRecord
  has_one_attached :image
  has_many :rooms, dependent: :destroy
  validates :name, :address, presence: true
  has_many :food_items, dependent: :destroy

  scope :search, ->(query) {

    return all if query.blank?

    where(
      "LOWER(name) LIKE :q
      OR LOWER(address) LIKE :q",
      q: "%#{query.downcase}%"
    )

  }
end
