class Trip < ActiveRecord::Base
  has_attached_file :trip_image, styles: { medium: '400x250', large: '900x350' }, default_url: '/images/medium/default-trip-img.jpg'
  validates_attachment_content_type :trip_image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates_numericality_of :price, on: :create, greater_than_or_equal_to: 1
  validates :status, presence: true

  has_and_belongs_to_many :categories
  has_many :orders_trips
  has_many :orders, through: :orders_trips

  before_validation :init

  def quantity_in_order(order_id)
    OrdersTrip.find_by(order_id: order_id, trip_id: id).quantity
  end

  def self.get_top_sellers
    top_sellers = self.top_ordered_trips
    top_trip_ids = top_sellers.sort_by(&:last).reverse.to_h.keys[0..2]
    top_trip_ids.map { |trip_id| Trip.find(trip_id) }
  end

  def self.top_ordered_trips
    self.all.reduce({}) do |result, trip|
      quantity = trip.orders_trips.reduce(0) { |sum, o| sum= o.quantity.to_i }
      result[trip.id] = quantity
      result
    end
  end

  def create_trip_with_category(params)
    trip = Trip.new(trip_params(params))
    if !params[:category_ids].nil? && trip.save
      add_categories_trips(params[:category_ids], trip.id)
      true
    else
      false
    end
  end

  def add_categories_trips(category_ids, trip_id)
    category_ids.each do |cat_id|
      CategoriesTrip.create(category_id: cat_id, trip_id: trip_id)
    end
  end

  def active?
    self.status == 'active'
  end

  private

  def trip_params(params)
    { title: params[:title],
      description: params[:description],
      price: params[:price],
      trip_image: params[:image] }
  end

  def init
    self.status ||= 'active'
  end
end
