class CreateGoupsUsers < ActiveRecord::Migration
  def change
    create_table :goups_users, id: false do |t|
    	t.belongs_to :group
      t.belongs_to :user
    end
  end
end




