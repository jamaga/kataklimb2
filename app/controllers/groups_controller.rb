class GroupsController < ApplicationController
	def index
	end

	def show
    @user = Group.find(params[:id])
  end

  def destroy
    group = Group.find(params[:id]).destroy
    redirect_to root_path
  end

end
