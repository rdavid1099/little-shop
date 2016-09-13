class CreateJoinTableCategoriesTrips < ActiveRecord::Migration
  def change
    create_join_table :categories, :trips do |t|
      t.index [:category_id, :trip_id]
      t.index [:trip_id, :category_id]
    end
  end
end
