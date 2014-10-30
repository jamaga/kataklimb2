class PlacesController < ApplicationController

	def index
		@places = Place.all
	end

	def new
		@place = Place.new
	end

	def create
		@place = Place.create(name: params[:place][:name], kind: params[:place][:kind], location: params[:place][:location], url: params[:place][:url])
		redirect_to places_path
	end

	def show
    @place = Place.find(params[:id])
  end

  def destroy
   	place = Place.find(params[:id]).destroy
    redirect_to places_path
  end

  def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])
		puts '='*100
		puts params.inspect
		puts '='*100
		@place.update_attributes(name: params[:place][:name], kind: params[:place][:kind], location: params[:place][:location], url: params[:place][:url])
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

end
