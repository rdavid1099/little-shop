class ChangePriceFormatInTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :price
    add_column :trips, :price, :decimal, :precision => 8, :scale => 2
  end
end
