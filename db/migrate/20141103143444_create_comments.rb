class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.references :group, index: true
    	t.references :user, index: true
    	t.string :title
    	t.string :content

      t.timestamps
    end
  end
end
