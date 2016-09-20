class RemoveImageFromTrip < ActiveRecord::Migration
  def change
    remove_column :trips, :image
  end
end
