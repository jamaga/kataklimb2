class Rating < ActiveRecord::Base
  belongs_to :place
  validates :score, :inclusion => { :in => 0..5, :message => " should be between 0 to 5" }

end
