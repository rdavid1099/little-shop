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
    top_trip_ids = get_top_selling_trips.keys
    top_trip_ids += add_random_trips(top_trip_ids) if top_trip_ids.count < 3
    top_trip_ids.map { |trip_id| Trip.find(trip_id) }
  end

  def self.add_random_trips(top_trip_ids)
    Trip.order('RANDOM()').limit(3 - top_trip_ids.count).map(&:id)
  end

  def self.get_top_selling_trips
    Trip.joins(:orders_trips).group(:quantity).order('count(*) DESC').limit(3).count
  end

  private

  def init
    self.status ||= 'active'
  end
end
