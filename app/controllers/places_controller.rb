class PlacesController < ApplicationController
	before_filter :get_place, only: [:show, :edit, :update]
	before_filter :authenticate, except: [:index, :show]

	def index
		@places = Place.all
	end

	def new
		@place = Place.new
	end

	def create
		@place = Place.new(place_params)
		if @place.save
			redirect_to places_path
		else
			render :new
		end
	end

  def destroy
   	place = Place.find(params[:id]).destroy
    redirect_to places_path
  end

	def update
		puts '='*100
		puts params.inspect
		puts '='*100
		@place.update_attributes(place_params)
		redirect_to place_path(@place)
	end

	def join
  	@place = Place.find(params[:place_id])
  	@place.groups << current_user.group
  	redirect_to places_path, notice: "You joined this place to group"
	end

	def addplace
		@place = Place.find(params[:place])
		@place.groups << Group.find(params[:group_id])
		redirect_to places_path, notice: "you have chose place for group"
	end

	#private
	def get_place
		@place = Place.find(params[:id])
	end

	def place_params
		params.require(:place).permit(:name, :kind, :location, :placeimage, :url)
	end
end
