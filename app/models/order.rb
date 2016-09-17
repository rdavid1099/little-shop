class Order < ActiveRecord::Base
  scope :statuses, -> (status) { where status: status }
  validates :status, presence: true
  validates_inclusion_of :status, in: %w(paid ordered cancelled completed)
  has_many :orders_trips
  has_many :trips, through: :orders_trips

  def total_price
    orders_trips.reduce(0) do |result, ot|
      result + (ot.quantity.to_f * ot.trip.price.to_f)
    end
  end
end
