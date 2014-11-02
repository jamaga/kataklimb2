class Place < ActiveRecord::Base
	has_many :groups

	has_attached_file :placeimage
 	validates_attachment_content_type :placeimage, :content_type => /\Aimage\/.*\Z/

 	 geocoded_by :location

 	 after_validation :geocode 
end
