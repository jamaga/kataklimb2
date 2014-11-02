class Place < ActiveRecord::Base
	has_many :groups
	has_many :ratings

	has_attached_file :placeimage
 	validates_attachment_content_type :placeimage, :content_type => /\Aimage\/.*\Z/

 	geocoded_by :location

 	after_validation :geocode 

 	def average_rating
 		sum = 0
		self.ratings.each do |rating|
			sum += rating.score 
		end
		sum / ratings.count
	end
end


