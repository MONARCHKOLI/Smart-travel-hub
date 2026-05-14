class Room < ApplicationRecord
  belongs_to :motel

  has_one_attached :image
end
