class GroupsController < ApplicationController

	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.create(name: params[:group][:name])
		redirect_to groups_path
		@group.users << current_user
	end

	def show
    @group = Group.find(params[:id])
  end

  def destroy
    group = Group.find(params[:id]).destroy
    redirect_to groups_path
  end

	def edit
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])
		@group.update(name: params[:group][:name])
		redirect_to group_path(@group)
	end

	def join
  	@group = Group.find(params[:group_id])
  	@group.users << current_user
  	redirect_to group_path(@group)
	end

end




