class RatingsController < ApplicationController

  def new
    @place = Place.find(params[:place_id])
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    place = Place.find(params[:place_id]) 
    place.ratings << @rating
    if @rating.save
      redirect_to place_path(@rating.place.id)
    else
      redirect_to place_path(place.id), notice: 'you have already rated this place' 
    end
  end

  private

    def rating_params
      params.require(:rating).permit(:score, :user_id) 
    end

end

#  def update
#    @rating = Rating.find(params[:id])
#    @comment = @rating.comment
#    	if @rating.update_attributes(score: params[:score])
#      respond_to do |format|
#        format.js
#      end
#    	end
#  end

# def average_rating
#   ratings.sum(:score) / ratings.size
# end

# end