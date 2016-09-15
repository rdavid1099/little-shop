class CreateJoinTableOrderTrips < ActiveRecord::Migration
  def change
    create_join_table :orders, :trips do |t|
      t.index [:order_id, :trip_id]
      t.index [:trip_id, :order_id]
      t.string :quantity
      t.timestamps null: false
    end
  end
end
