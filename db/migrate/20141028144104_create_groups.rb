class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string :name
    	t.string :climbing_level
      t.timestamps
    end
  end
end
