class AddAttachmentPlaceimageToPlaces < ActiveRecord::Migration
  def self.up
    change_table :places do |t|
      t.attachment :placeimage
    end
  end

  def self.down
    remove_attachment :places, :placeimage
  end
end
