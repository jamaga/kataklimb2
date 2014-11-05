class Rating < ActiveRecord::Base
  belongs_to :place
  
  validates :user_id, uniqueness: { scope: :place_id }

  validates :score, :inclusion => { :in => 0..5, :message => " should be between 0 to 5" }
	belongs_to :user  
end
