class AddPlaceIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :place_id, :ineger
  end
end
