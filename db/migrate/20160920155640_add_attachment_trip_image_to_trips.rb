class AddAttachmentTripImageToTrips < ActiveRecord::Migration
  def self.up
    change_table :trips do |t|
      t.attachment :trip_image
    end
  end

  def self.down
    remove_attachment :trips, :trip_image
  end
end
