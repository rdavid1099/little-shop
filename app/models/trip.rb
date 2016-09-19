class Trip < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :status, presence: true

  has_and_belongs_to_many :categories
  has_many :orders_trips
  has_many :orders, through: :orders_trips

  before_validation :init

  def quantity_in_order(order_id)
    OrdersTrip.find_by(order_id: order_id, trip_id: id).quantity
  end

  def self.get_top_sellers
    top_sellers = self.get_top_selling_trips
    top_trip_ids = top_sellers.sort_by(&:last).reverse.to_h.keys[0..2]
    top_trip_ids.map { |trip_id| Trip.find(trip_id) }
  end

  def self.get_top_selling_trips
    self.all.reduce({}) do |result, trip|
      quantity = trip.orders_trips.reduce(0) { |sum, o| sum += o.quantity.to_i }
      result[trip.id] = quantity
      result
    end
  end

  private

  def init
    self.status ||= 'active'
  end
end
