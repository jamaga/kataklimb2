class Group < ActiveRecord::Base
 has_and_belongs_to_many :users
 belongs_to :creator, class_name: "User"
 belongs_to :place
 has_many :comments
end
