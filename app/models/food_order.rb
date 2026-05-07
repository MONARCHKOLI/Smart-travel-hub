class FoodOrder < ApplicationRecord
  belongs_to :booking
  belongs_to :food_item
end
