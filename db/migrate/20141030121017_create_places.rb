class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
    	t.string :name
    	t.string :kind
    	t.string :location
    	t.string :picture
    	t.string :url
      t.timestamps
    end
  end
end
