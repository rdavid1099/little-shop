class OrdersTrip < ActiveRecord::Base
  validates :quantity, presence: true
  belongs_to :trip
  belongs_to :order
end
