class Trip < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  has_and_belongs_to_many :categories
  has_many :orders_trips
  has_many :orders, through: :orders_trips
end
