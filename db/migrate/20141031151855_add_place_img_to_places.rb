class AddPlaceImgToPlaces < ActiveRecord::Migration
  def change
  	add_attachment :places, :placeimage
  end
end
