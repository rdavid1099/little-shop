class Order < ActiveRecord::Base
  validates :status, presence: true
  validates_inclusion_of :status, in: %w(paid ordered cancelled completed)
  has_many :orders_trips
  has_many :trips, through: :orders_trips
end
