class CategoriesTrip < ActiveRecord::Base
  belongs_to :trip
  belongs_to :category

  validates :trip_id, presence: true
  validates :category_id, presence: true
end
