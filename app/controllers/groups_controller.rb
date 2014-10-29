class GroupsController < ApplicationController

	def index
		@groups = Group.all
	end

	def show
    @group = Group.find(params[:id])
  end

  def destroy
    group = Group.find(params[:id]).destroy
    redirect_to root_path
  end

end
